class CType < ActiveRecord::Base
	has_many :changes
	def self.dropdown_options 
		options = CType.all.map{|r| [r.name, r.id] }
		[["Please select", -1]] + options 
	end
    def self.selected(ctype)
        if ctype == nil 
            ctype = -1
        end
        ctype
    end
end
