class UsersController < ApplicationController

	def index
		@categories = Category.all
		current_user = session[:user_id]
		if params[:search].present?
			@users = User.near(params[:search], 50)
		else
			@users = User.all
		end
			@hash = Gmaps4rails.build_markers(@users) do |user, marker|
				if current_user && user.id == current_user.id
						marker.lat user.latitude
						marker.lng user.longitude
						marker.picture({
			       "url" => "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
			       "width" =>  32,
			       "height" => 32})
						marker.json({:first_name => user.first_name })
						marker.infowindow render_to_string(:partial => "/users/tag", :locals => { :user => user})
				else
					marker.lat user.latitude
					marker.lng user.longitude
					marker.infowindow render_to_string(:partial => "/users/tag", :locals => { :user => user})
				end
			end
		end

	def new
		@user = User.new
	end


	def create
	   @user = User.new(users_params)
	   session[:user_id] = @user.id
	   respond_to do |format|
	     if @user.save
	       format.html { redirect_to @user, notice: 'user was successfully created.' }
	       format.json { render :show, status: :created, user: @user }
	     else
	       format.html { render :new }
	       format.json { render json: @user.errors, status: :unprocessable_entity }
	     end
	   end
 	end

 	def show
 		@user = User.find(params[:id])
 	end


	private

	def users_params
		params.require(:user).permit(:first_name,:last_name,:email, :password,:city, :state, :zip,:st_num, :st_name, :latitude, :longitude )
	end
end
