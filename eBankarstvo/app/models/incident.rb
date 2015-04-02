class Incident < ActiveRecord::Base
  belongs_to :category
  belongs_to :priority
  belongs_to :user
  def self.dropdown_options 
  	@incidents = Incident.where("status = ?", "Closed")
	options = @incidents.map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
  end
end
