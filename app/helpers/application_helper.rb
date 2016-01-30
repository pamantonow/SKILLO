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
end
