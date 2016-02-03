class CategoriesController < ApplicationController
	
	before_action :authenticate_user!

	def show
	@category = Category.find(params[:id])
	@categories = Category.all
	@users = @category.teachers
	@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		next if user == current_user
		marker.lat user.latitude
		marker.lng user.longitude
		marker.json({:id => user.id})
	end
	p "*****"
	p @hash
	@home = {lat: current_user.latitude,  lng:  current_user.longitude}
	render 'users/index'
	end

end