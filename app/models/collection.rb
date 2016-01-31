class Collection < ActiveRecord::Base
	belongs_to :teacher, class_name: "User" 
	belongs_to :skill 
	has_one :category, through: :skill
end
