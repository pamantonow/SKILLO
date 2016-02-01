class Message < ActiveRecord::Base
	belongs_to :user 
	belongs_to :request 

	# validates :user, :request, :content, {presence: true}
end
