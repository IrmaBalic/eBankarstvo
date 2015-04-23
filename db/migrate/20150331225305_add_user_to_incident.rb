class AddUserToIncident < ActiveRecord::Migration
  def change
  	add_reference :incidents, :user, index: true
  	add_column :incidents, :confirmed, :string, default: "N"
  end
end
