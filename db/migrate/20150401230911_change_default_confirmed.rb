class ChangeDefaultConfirmed < ActiveRecord::Migration
  def change
  	change_column :incidents, :confirmed, :string, default: "/"
  end
end
