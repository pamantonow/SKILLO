class Request < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	belongs_to :receiver, class_name: "User"
	belongs_to :skill
	has_many :messages, dependent: :destroy


	validates  :sender_id, :receiver_id, :skill_id, :content, presence: true

end
