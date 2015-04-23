class Priority < ActiveRecord::Base
	has_many :incidents
	def self.dropdown_options 
		options = Priority.all.map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
	end
    def self.selected(priority)
        if priority == nil 
            priority = -1
        end
        priority
    end
end
