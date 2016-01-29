class User < ActiveRecord::Base
	has_secure_password

	has_many :sent_requests, class_name: "Request", foreign_key: :sender_id #w
	has_many :recieved_requests, class_name: "Request", foreign_key: :reciever_id #w
	has_many :collections, foreign_key: :teacher_id #w 
	has_many :skills, through: :collections #w
	has_many :messages #w
end
