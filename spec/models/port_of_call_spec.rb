require 'rails_helper'

RSpec.describe PortOfCall, :type => :model do
  describe 'validate' do

    subject { create :port_of_call }

    it 'should have valid factory' do
      build(:port_of_call).should be_valid
    end

    it 'arrive to be earlyer then leave' do
     build(:port_of_call, arrive: Time.now, leave: Time.now-10).should_not be_valid
    end

    it 'arrive to be present' do
      should validate_presence_of :arrive
    end

    it 'leave to be present' do
      should validate_presence_of :leave
    end

    it 'port to be present' do
      should validate_presence_of :port
    end

    it 'ship to be present' do
      should validate_presence_of :ship
    end
  end
end
