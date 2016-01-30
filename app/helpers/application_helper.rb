module ApplicationHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id] )
	end

	def user_id
		current_user.id
	end

	def add_category
		categories = Category.all
		cat_index = []
		categories.each_with_index do |cat, index|
			cat_index << [cat.name, index]
		end
		cat_index
	end
end
