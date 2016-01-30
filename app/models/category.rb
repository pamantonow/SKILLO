class Category < ActiveRecord::Base
	has_many :skills
	has_many :collections, through: :skills
	has_many :teachers, through: :skills
end
