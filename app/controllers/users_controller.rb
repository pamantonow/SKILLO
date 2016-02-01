class UsersController < ApplicationController

	def index
		@categories = Category.all
		if params[:search].present?
			@users = User.near(params[:search], 50)
		else
			@users = User.all
		end

		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
			marker.lat user.latitude
			marker.lng user.longitude
			marker.json({:id => user.id.to_s })
		end
		@home = {lat: current_user.latitude,  lng:  current_user.longitude}
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)
		respond_to do |format|
			if @user.save
				session[:user_id] = @user.id
				format.html { redirect_to @user, notice: 'user was successfully created.' }
				format.json { render :show, status: :created, user: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
 	end

 	def show
 		@request = Request.new
 		@user = User.find(params[:id])
 	end

	private

	def users_params
		params.require(:user).permit(:first_name,:last_name,:email, :password,:city, :state, :zip,:st_num, :st_name, :latitude, :longitude )
	end
end
