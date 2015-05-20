class CreateCTypes < ActiveRecord::Migration
  def change
    create_table :c_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
