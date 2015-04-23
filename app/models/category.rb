class Category < ActiveRecord::Base
	has_many :incidents
	has_many :resported_incidents

	def self.dropdown_options 
		options = Category.all.map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
	end
    def self.selected(category)
        if category == nil 
            category = -1
        end
        category
    end
    
end
