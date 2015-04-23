class Change < ActiveRecord::Base
  belongs_to :category
  belongs_to :priority
  belongs_to :user
end
