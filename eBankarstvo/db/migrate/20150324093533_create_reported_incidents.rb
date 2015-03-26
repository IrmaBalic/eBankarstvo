class CreateReportedIncidents < ActiveRecord::Migration
  def change
    create_table :reported_incidents do |t|
      t.string :name
      t.text :description
      t.references :category, index: true

      t.timestamps
    end
  end
end
