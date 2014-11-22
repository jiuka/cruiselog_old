class CreatePortOfCalls < ActiveRecord::Migration
  def change
    create_table :port_of_calls do |t|
      t.references :ship, index: true
      t.references :port, index: true
      t.datetime :arrive
      t.datetime :leave

      t.timestamps
    end
  end
end
