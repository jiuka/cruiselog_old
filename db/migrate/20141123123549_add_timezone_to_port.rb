class AddTimezoneToPort < ActiveRecord::Migration
  def change
    add_column :ports, :tz, :string
  end
end
