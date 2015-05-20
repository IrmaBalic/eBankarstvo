class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
