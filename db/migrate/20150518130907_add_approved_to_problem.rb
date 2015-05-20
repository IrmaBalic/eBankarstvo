class AddApprovedToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :approved, :string
  end
end
