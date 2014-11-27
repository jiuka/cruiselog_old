class AddPositionUpdateToShip < ActiveRecord::Migration
  def change
    add_column :ships, :location_update, :datetime
  end
end
