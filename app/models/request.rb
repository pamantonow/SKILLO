class Request < ActiveRecord::Base
	belongs_to :sender, class_name: "User" #w
	belongs_to :reciever, class_name: "User" #w 
	belongs_to :skill #w
end
