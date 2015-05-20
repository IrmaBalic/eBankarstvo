class AddCtypeToChanges < ActiveRecord::Migration
  def change
  	add_reference :changes, :c_type, index: true
  end
end
