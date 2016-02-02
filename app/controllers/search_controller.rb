class SearchController < ApplicationController
	
	def index
		searched_skill = params[:search].strip.downcase
		searched_city =  params[:city].strip.downcase
		@users = []	
		if searched_city == ""
			@results = User.all
		else
			@results = []
			User.all.each do |user|
				next if user == current_user 
				if user.city.downcase == searched_city 
					@results << user
				end
			end
		end
		if searched_skill != ""
			@results.each do |user|
				next if user == current_user 
				user.skills.each do |skill|
					if (skill.name.downcase == searched_skill)
						@users << user
					end
				end
			end
		else
			@users = @results
		end
		@search = @users
		# type of request 
		if request.xhr?
      		respond_to do |format|
        	format.json { render json: @search }
      		end
    	else
			@hash = Gmaps4rails.build_markers(@users) do |user, marker|
				marker.lat user.latitude
				marker.lng user.longitude
				marker.json({:id => user.id.to_s })
			end
			@home = {lat: current_user.latitude,  lng:  current_user.longitude}
			@categories = Category.all
			render 'users/index'
		end
	end


end