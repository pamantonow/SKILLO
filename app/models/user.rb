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

	# def self.sort_distance(users)
	# 	users.sort! {|a,b| a.distance <=> b.distance }
	# 	users
	# end

	def distance(current_user)
		distance = Geocoder::Calculations.distance_between([current_user.latitude, current_user.longitude], [self.latitude, self.longitude])
		distance.round(1)
	end


 	def address
		[st_num, st_name, city, state, zip].compact.join(' ')
	end

	geocoded_by :address
	after_validation :geocode

	# Return a valid gravatar URL
	# default image rating is set to "g"
	# default image size is set to 200x200 px
	# if user does not have gravatar account, return a random "retro" gravatar
	def create_gravatar_url
		"http://www.gravatar.com/avatar/#{md5_hash_email(self.email)}?r=g&s=200&d=retro"
	end

	private
	# Return an md5 hash for a given email
	def md5_hash_email(email)
		Digest::MD5.hexdigest(email.strip.downcase)
	end

end
