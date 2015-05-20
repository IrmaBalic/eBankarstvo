class AddConfirmedToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :confirmed, :string, default: "/"
  end
end
