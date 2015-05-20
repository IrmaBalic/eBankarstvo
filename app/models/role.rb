class Role < ActiveRecord::Base
	has_many :users
	def self.dropdown_options 
		options = Role.all.map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
	end
    def self.selected(role)
        if role == nil 
            role = -1
        end
        role
    end
end
