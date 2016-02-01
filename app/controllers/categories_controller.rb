class CategoriesController < ApplicationController
		def index
		@category = Category.find(params[:id])
		# @category.skills.each do |skill|
		# 	@teachers << skill.users
		# end
		# @teacher_by_category.flatten
	end

		def show
		@category = Category.find(params[:id])
		@categories = Category.all
		@users = @category.teachers 
			@teacher_by_category = @users.near(current_user.city, 50)
			@hash = Gmaps4rails.build_markers(@users) do |user, marker|
				if user.id == current_user.id
					marker.lat user.latitude
					marker.lng user.longitude
					marker.json({:id => user.id.to_s })
					# marker.picture({
		       # "url" => "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
		       # "width" =>  32,
		       # "height" => 32})
					# marker.json({:first_name => user.first_name })
					# marker.infowindow render_to_string(:partial => "/users/tag", :locals => { :user => user})
				else
					marker.lat user.latitude
					marker.lng user.longitude
					marker.json({:id => user.id })
					marker.infowindow render_to_string(:partial => "/users/tag", :locals => { :user => user})
				end
			end
			@home = {lat: current_user.latitude,  lng:  current_user.longitude}
		end
end