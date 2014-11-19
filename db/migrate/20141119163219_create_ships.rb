class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :title
      t.references :line, index: true
      t.references :port_of_origin, index: true

      t.timestamps
    end
  end
end
