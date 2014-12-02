class AddCaptainToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :captain, :boolean, default: false
  end
end
