class User < ActiveRecord::Base
	has_secure_password
	belongs_to :role
	has_many :incidents
end
