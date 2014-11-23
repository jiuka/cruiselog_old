require 'rails_helper'

RSpec.describe Ship, :type => :model do
  describe 'validate' do

    subject { create :ship }

    it 'excpect have valid factory' do
      ship = build(:ship)
      expect(ship).to be_valid
    end

    it 'line to be present' do
      expect validate_presence_of :line
    end

  end
end
