class CreateCruiseSegments < ActiveRecord::Migration
  def change
    create_table :cruise_segments do |t|
      t.references :cruise, index: true
      t.references :from, index: true
      t.references :to, index: true
      t.line_string :route, :geographic => true

      t.timestamps
    end
  end
end
