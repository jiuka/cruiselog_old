require 'rails_helper'

RSpec.describe Port, :type => :model do

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
