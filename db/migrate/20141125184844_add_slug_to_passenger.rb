class AddSlugToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :slug, :string
    add_index :passengers, :slug, unique: true
  end
end
