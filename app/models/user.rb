class User < ActiveRecord::Base
	has_secure_password

	has_many :sent_requests, class_name: "Request", foreign_key: :sender_id #w
	has_many :recieved_requests, class_name: "Request", foreign_key: :reciever_id #w
	has_many :collections, foreign_key: :teacher_id #w 
	has_many :skills, through: :collections #w
	has_many :messages #w


	validates :first_name, :last_name, :email, :password_digest, :city, :state, :zip, :st_num, :st_name, {presence: true}
	validates :email, uniqueness: true
	
    validates :zip, :length => { :is => 5 } 
    validates :zip, :st_num, :numericality => { :only_integer => true }
	#validates :first_name, :last_name, :city, :state, :st_name, presence: true

end
