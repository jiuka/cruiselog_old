class AddSlogToCruise < ActiveRecord::Migration
  def change
    add_column :cruises, :slug, :string
    add_index :cruises, :slug, unique: true
  end
end
