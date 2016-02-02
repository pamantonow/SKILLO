class User < ActiveRecord::Base

	has_many :sent_requests, class_name: "Request", foreign_key: :sender_id
	has_many :received_requests, class_name: "Request", foreign_key: :receiver_id
	has_many :written_reviews, class_name: "Review", foreign_key: :sender_id
	has_many :received_reviews, class_name: "Review", foreign_key: :receiver_id
	has_many :collections, foreign_key: :teacher_id
	has_many :skills, through: :collections
	has_many :messages
	has_many :categories, through: :skills

	validates :first_name, :last_name, :email, :password_digest, :city, :state, :zip, :st_num, :st_name, presence: true
	validates :email, uniqueness: true
  validates :zip, :length => { :is => 5 }
  validates :zip, :st_num, :numericality => { :only_integer => true }
	#validates :first_name, :last_name, :city, :state, :st_name, presence: true

	has_secure_password

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

	# def accepted_requests?
	# 	self.received_requests.where(sender_id: user_id).each do |request|
	# 		p "=============#{request.accepted}"
	# 	end
	# end
end
