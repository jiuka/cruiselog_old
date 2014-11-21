class AddSlogToCruiseSegment < ActiveRecord::Migration
  def change
    add_column :cruise_segments, :slug, :string
    add_index :cruise_segments, [:slug, :cruise_id], unique: true
  end
end
