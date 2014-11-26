class AddPassengerToCruise < ActiveRecord::Migration
  def change
    add_reference :cruises, :passenger, index: true
  end
end
