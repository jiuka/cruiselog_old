class AddOrderDateToPortOfCall < ActiveRecord::Migration
  def change
    add_column :port_of_calls, :orderdate, :date
  end
end
