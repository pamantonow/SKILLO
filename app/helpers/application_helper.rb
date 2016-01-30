module ApplicationHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id] )
	end

	def user_id
		current_user.id
	end
end
