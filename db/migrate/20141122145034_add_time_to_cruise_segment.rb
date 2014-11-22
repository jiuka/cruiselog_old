class AddTimeToCruiseSegment < ActiveRecord::Migration
  def change
    add_column :cruise_segments, :leave, :datetime
    add_column :cruise_segments, :arrive, :datetime
  end
end
