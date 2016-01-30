class User < ActiveRecord::Base
	has_secure_password

	has_many :sent_requests, class_name: "Request", foreign_key: :sender_id #w
	has_many :recieved_requests, class_name: "Request", foreign_key: :reciever_id #w
	has_many :collections, foreign_key: :teacher_id #w
	has_many :skills, through: :collections #w
	has_many :messages #w

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

	def self.authenticate(entered_email,input_password)
		@user = User.find_by(email: entered_email)
		if @user && @user.password == input_password
			return @user
		else
			return nil
		end
	end

end
