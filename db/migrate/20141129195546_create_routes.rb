class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :from, index: true
      t.references :to, index: true
      t.line_string :line
      t.string :title

      t.timestamps
    end
  end
end
