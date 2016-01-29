class Collection < ActiveRecord::Base
	belongs_to :teacher, class_name: "User" #w
	belongs_to :skill #w
end
