require 'rails_helper'

RSpec.describe PortOfCall, :type => :model do
  describe 'validate' do

    subject { create :port_of_call }

    it 'excpect have valid factory' do
      port = build(:port_of_call)
      expect(port).to be_valid
    end

    it 'arrive to be earlyer then leave' do
      port = build(:port_of_call, arrive: Time.now.to_s, leave: (Time.now-10).to_s)
      expect(port).to_not be_valid
    end

    it 'port to be present' do
      expect(build(:port_of_call, :port => nil)).to_not be_valid
    end

    it 'ship to be present' do
      expect(build(:port_of_call, :ship => nil)).to_not be_valid
    end
  end
end
