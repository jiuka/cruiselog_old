class CreateCruises < ActiveRecord::Migration
  def change
    create_table :cruises do |t|
      t.string :title
      t.references :ship, index: true

      t.timestamps
    end
  end
end
