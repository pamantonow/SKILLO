class Message < ActiveRecord::Base
	belongs_to :user 
	belongs_to :request 

	validates :content, :user, :request, {presence: true}
end
