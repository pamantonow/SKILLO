class Message < ActiveRecord::Base
	belongs_to :user #w
	belongs_to :request #w
end
