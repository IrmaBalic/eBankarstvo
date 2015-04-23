class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.string :name
      t.text :description
      t.references :category, index: true
      t.references :priority, index: true
      t.references :user, index: true
      t.string :status
      t.string :confirmed
      t.text :comment

      t.timestamps
    end
  end
end
