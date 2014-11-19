class AddSlogToShip < ActiveRecord::Migration
  def change
    add_column :ships, :slug, :string
    add_index :ships, :slug, unique: true
  end
end
