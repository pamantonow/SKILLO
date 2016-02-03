class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:new, :create]


	def index
		@categories = Category.all
		@users = User.all
		p "#{session[:user_id]}************"
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
			next if user == current_user

			marker.lat user.latitude
			marker.lng user.longitude
			marker.json({:id => user.id })
			# p "#{marker.lat}"
			# p "#{user.first_name}"
		end
		@hash = @hash.select {|marker| marker[:lat] != nil}
		@home = {lat: current_user.latitude,  lng:  current_user.longitude}
		if request.xhr?
      		respond_to do |format|
        		format.json { render json: @users }
      		end
    	end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)
		@user.avatar = @user.create_gravatar_url
		respond_to do |format|
			if @user.save
				session[:user_id] = @user.id
				format.html { redirect_to @user, notice: 'user was successfully created.' }
				# format.json { render :show, status: :created, user: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
 	end

 	def show
 		# @request = Request.new
 		puts "params[:id]: #{params[:id]}"
 		@user = User.find(params[:id])
 		"test"
 	end

 	def edit
 		@user = User.find(params[:id])
 		render :'users/edit'
 	end

 	def update
 		@user = User.find(params[:id])
 		if current_user == @user
 			puts "======="
 			p @user
	 		@user = @user.assign_attributes(users_params)
	 		p @user
	 		puts "+++++++++"
	 		if @user.save
	 			redirect_to user_path(@user)
	 		else
	 			@errors = @user.errors.full_messages
 			end
 		else
 			render text: "Couldn't find what you were looking for", status: 404
 		end
 	end

	private

	def users_params
		params.require(:user).permit(:first_name,:last_name,:email, :password,:city, :state, :zip,:st_num, :st_name, :latitude, :longitude,:occupation, :education,:description )
	end
end
