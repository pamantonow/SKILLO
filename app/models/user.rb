class User < ActiveRecord::Base
	has_secure_password


	has_many :sent_requests, class_name: "Request", foreign_key: :sender_id 
	has_many :recieved_requests, class_name: "Request", foreign_key: :reciever_id 
	has_many :collections, foreign_key: :teacher_id  
	has_many :skills, through: :collections 
	has_many :messages 


	validates :first_name, :last_name, :email, :password_digest, :city, :state, :zip, :st_num, :st_name, presence: true
	validates :email, uniqueness: true
	
    validates :zip, :length => { :is => 5 } 
    validates :zip, :st_num, :numericality => { :only_integer => true }
	#validates :first_name, :last_name, :city, :state, :st_name, presence: true




	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	def city_state
		"#{self.city}, #{self.state}"
	end

 	def address
		[st_num, st_name, city, state, zip].compact.join(' ')
	end 
 
	geocoded_by :address
	after_validation :geocode
end
