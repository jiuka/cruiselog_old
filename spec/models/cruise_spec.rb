require 'rails_helper'

RSpec.describe Cruise, :type => :model do
  describe 'validate' do

    subject { build :cruise }

    it 'ship to be present' do
      is_expected.to validate_presence_of(:ship)
    end

    it 'embark to be present' do
      is_expected.to validate_presence_of(:embark)
    end

    it 'disembark to be present' do
      is_expected.to validate_presence_of(:disembark)
    end

#    it 'embark to be earlyer then disembark' do
#      port = build(:port_of_call, arrive: Time.now, leave: Time.now-10)
#      expect(port).to_not be_valid
#    end

  end
end
