require 'json'

namespace :cruiselog do

  namespace :import do
    desc "Import FleetMon MyVessel API"
    task fleetmon: :environment do
      require 'dotenv'
      Dotenv.load
      unless ENV.has_key? 'FLEETMON_USER' and ENV.has_key? 'FLEETMON_KEY'
        puts "FLEETMON_USER and FLEETMON_KEY is required"
        return
      end

      # Prepare Logger
      pos_logger ||= Logger.new("#{Rails.root}/log/import_fleetmon.log")

      fm_host = ENV['FLEETMON_HOST'] || 'www.fleetmon.com'
      fm_path = "/api/p/personal-v1/myfleet/?username=#{ENV['FLEETMON_USER']}&api_key=#{ENV['FLEETMON_KEY']}&format=json"
      response = Net::HTTP.get_response(fm_host,fm_path)
      data = JSON.parse response.body

      data['objects'].each do |object|
        next unless object['vessel']
        vessel = object['vessel']

        print "Import #{vessel['name']} (#{vessel['mmsinumber']})"

        ship = Ship.find_by(:imo => vessel['mmsinumber'].to_s)

        unless ship
          puts " not found"
          next
        end

        unless ship.location_update < DateTime.parse(vessel['positionreceived'])
          puts " not updated"
        end

        ship.location = "POINT(#{vessel['latitude']} #{vessel['longitude']})"
        ship.location_desc = vessel['location']
        ship.heading = vessel['heading'].to_f
        ship.location_update = vessel['positionreceived']

        pos_logger.info vessel.to_s

        if ship.save
          puts " updated"
        else
          puts " failed"
        end

      end
    end
  end

end
