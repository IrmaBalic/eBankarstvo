class AddPrioriyIdToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :priority_id, :integer
  end
end
