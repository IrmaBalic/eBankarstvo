class AddSolutionToIncidents < ActiveRecord::Migration
  def change
  	add_column :incidents, :solution, :string
  end
end
