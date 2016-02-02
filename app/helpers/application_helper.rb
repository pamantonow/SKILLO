module ApplicationHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id] )
	end

	def user_id
		current_user.id
	end

	def add_category
		categories = Category.all
		category_index = []
		categories.each_with_index do |cat, index|
			category_index << [cat.name, index+1]
		end
		category_index
	end

	def unread_messages
		current_user.received_requests.each do |m|
			if m.accepted == nil
				return true
			end
		end
		false
	end

	def count_messages
		counter = 0 
		current_user.received_requests.each do |m|
			if m.accepted == nil
				counter += 1
			end
		end
		counter.to_s
	end

	def accepted_requests?(user)
		# yes = false
		user.received_requests.where(sender_id: user_id).each do |request|
		 if request.accepted == true
		 	return true
		 end
		end
		return false
	end
		
end
