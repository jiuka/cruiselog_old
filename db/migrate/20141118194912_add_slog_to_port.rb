class AddSlogToPort < ActiveRecord::Migration
  def change
    add_column :ports, :slug, :string
    add_index :ports, :slug, unique: true
  end
end
