class Skill < ActiveRecord::Base
	has_many :collections #w
	has_many :teachers, through: :collections #w
	has_many :requests #w
end
