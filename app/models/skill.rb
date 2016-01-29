class Skill < ActiveRecord::Base
	has_many :collections 
	has_many :teachers, through: :collections 
	has_many :requests 
end
