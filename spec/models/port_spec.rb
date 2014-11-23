require 'rails_helper'

RSpec.describe Port, :type => :model do
  describe 'validates' do

    subject { create :port }

    it 'excpect have valid factory' do
      port = build(:port)
      expect(port).to be_valid
    end

    describe 'country' do
      it 'to be present' do
        expect(build(:port, :country => nil)).to_not be_valid
      end

      it 'DE is valid' do
        expect(build(:port, :country => "DE")).to be_valid
      end

      it 'XX is not valid' do
        expect(build(:port, :country => "XX")).to_not be_valid
      end
    end

    describe 'tz' do
      it 'to be present' do
        expect(build(:port, :tz => nil)).to_not be_valid
      end

      it 'Dublin is valid' do
        expect(build(:port, :tz => 'Dublin')).to be_valid
      end

      it 'Obstalden is not valid' do
        expect(build(:port, :tz => 'Obstalden')).to_not be_valid
      end
    end
  end

  describe '.location' do
    context 'first quadrant' do
      it 'returns 1N 2E' do
        port = Port.new location: "1N 2E"
        expect(port.location).to eq("1.0N 2.0E")
      end
    end

    context 'second quadrant' do
      it 'returns 1N 2W' do
        port = Port.new location: "1N 2W"
        expect(port.location).to eq("1.0N 2.0W")
      end
    end

    context 'third quadrant' do
      it 'returns 1S 2W' do
        port = Port.new location: "1S 2W"
        expect(port.location).to eq("1.0S 2.0W")
      end
    end

    context 'fourth quadrant' do
      it 'returns 1S 2E' do
        port = Port.new location: "1S 2E"
        expect(port.location).to eq("1.0S 2.0E")
      end
    end
  end

  describe '.location=' do
    describe 'first quadrant' do
      it 'parses positive' do
        port = Port.new location: "1N 2E"
        expect(port.latitude).to eq(1)
        expect(port.longitude).to eq(2)
      end

      it 'parses negative' do
        port = Port.new location: "-1S -2W"
        expect(port.latitude).to eq(1)
        expect(port.longitude).to eq(2)
      end
    end

    describe 'second quadrant' do
      it 'parses positive' do
        port = Port.new location: "1N 2W"
        expect(port.latitude).to eq(1)
        expect(port.longitude).to eq(-2)
      end

      it 'parses negative' do
        port = Port.new location: "-1S -2E"
        expect(port.latitude).to eq(1)
        expect(port.longitude).to eq(-2)
      end
    end

    describe 'third quadrant' do
      it 'parses positive' do
        port = Port.new location: "1S 2W"
        expect(port.latitude).to eq(-1)
        expect(port.longitude).to eq(-2)
      end

      it 'parses negative' do
        port = Port.new location: "-1N -2E"
        expect(port.latitude).to eq(-1)
        expect(port.longitude).to eq(-2)
      end
    end

    describe 'fourth quadrant' do
      it 'parses positive' do
        port = Port.new location: "1S 2E"
        expect(port.latitude).to eq(-1)
        expect(port.longitude).to eq(2)
      end

      it 'parses negative' do
        port = Port.new location: "-1N -2W"
        expect(port.latitude).to eq(-1)
        expect(port.longitude).to eq(2)
      end
    end
  end

  describe '.to_json' do
    it 'returns json' do
      require 'json'
      port = Port.new id: 0, title: 'port', country: 'CH', location: "-1N -2W"
      expect(JSON.parse(port.to_json))
    end
  end

end
