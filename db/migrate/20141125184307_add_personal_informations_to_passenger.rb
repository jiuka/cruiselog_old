class AddPersonalInformationsToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :firstname, :string
    add_column :passengers, :lastname, :string
    add_column :passengers, :fullname, :string
    add_column :passengers, :birthday, :datetime
    add_column :passengers, :sex, :string
  end
end
