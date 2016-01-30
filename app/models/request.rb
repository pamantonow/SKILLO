class Request < ActiveRecord::Base
	belongs_to :sender, class_name: "User" 
	belongs_to :reciever, class_name: "User"  
	belongs_to :skill 
	has_many :messages, dependent: :destroy

	validates  :sender_id,  :skill_id, :content, presence: true
end
