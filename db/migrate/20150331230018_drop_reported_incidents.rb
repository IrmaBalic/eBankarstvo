class DropReportedIncidents < ActiveRecord::Migration
  def change
  	drop_table :reported_incidents
  end
end
