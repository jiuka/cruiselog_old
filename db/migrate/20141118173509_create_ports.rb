class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string :title
      t.string :country, limit: 2
      t.point :location, :geographic => true

      t.timestamps
    end
  end
end
