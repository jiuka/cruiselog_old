class RenameTableUserToPassenger < ActiveRecord::Migration
  def change
    rename_table 'users', 'passengers'
  end
end
