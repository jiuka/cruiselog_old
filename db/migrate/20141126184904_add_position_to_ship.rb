class AddPositionToShip < ActiveRecord::Migration
  def change
    add_column :ships, :imo, :string
    add_column :ships, :location, :point
    add_column :ships, :location_desc, :string
    add_column :ships, :heading, :float
  end
end
