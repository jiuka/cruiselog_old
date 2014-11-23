require 'rails_helper'

RSpec.describe PortOfCall, :type => :model do
  describe 'validate' do

    subject { create :port_of_call }

    it 'excpect have valid factory' do
      port = build(:port_of_call)
      expect(port).to be_valid
    end

    it 'arrive to be earlyer then leave' do
      port = build(:port_of_call, arrive: Time.now, leave: Time.now-10)
      expect(port).to_not be_valid
    end

    it 'arrive to be present' do
      expect validate_presence_of :arrive
    end

    it 'leave to be present' do
      expect validate_presence_of :leave
    end

    it 'port to be present' do
      expect validate_presence_of :port
    end

    it 'ship to be present' do
      expect validate_presence_of :ship
    end
  end
end
