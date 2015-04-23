class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.text :description
      t.references :category, index: true
      t.references :priority, index: true
      t.string :status

      t.timestamps
    end
  end
end
