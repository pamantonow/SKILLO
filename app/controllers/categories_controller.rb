class CategoriesController < ApplicationController
		def show
		@category = Category.find(params[:id])
		@category.skills.each do |skill|
			@teachers << skill.users
		end
		@users.flatten
	end
end