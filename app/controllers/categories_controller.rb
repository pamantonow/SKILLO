class CategoriesController < ApplicationController
	
	before_action :authenticate_user!
	
		def index
	end

		def show
		@category = Category.find(params[:id])
		@categories = Category.all
		@users = @category.teachers 
			@teacher_by_category = @users.near(current_user.city, 50)
			@hash = Gmaps4rails.build_markers(@users) do |user, marker|
					marker.lat user.latitude
					marker.lng user.longitude
					marker.json({:id => user.id})
				
			end
			@home = {lat: current_user.latitude,  lng:  current_user.longitude}
		end
end