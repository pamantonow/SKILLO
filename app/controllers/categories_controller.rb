class CategoriesController < ApplicationController
	
	before_action :authenticate_user!

	def show
		@category = Category.find(params[:id])
		@users = @category.teachers.uniq.select { |num|  num != current_user  }
		p @users
		@categories = Category.all
		
		if request.xhr?
			respond_to do |format|
				format.json { render "categories/show" }
			end
		end
	end

end