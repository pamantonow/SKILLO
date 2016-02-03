class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:new, :create]


	def index
		@categories = Category.all
		@users = User.all.select { |num|  num != current_user  } 	
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
 	 @request = Request.new
 		puts "params[:id]: #{params[:id]}"
 		@user = User.find(params[:id])
 		"test"
 	end

 	def edit
 		@user = User.find(params[:id])
 		if current_user == @user
 			render :'users/edit'
 		else
 			render text: "Couldn't find what you were looking for", status: 404
 		end
 	end

 	def update
 		@user = User.find(params[:id])
 		if current_user == @user
	 		@user.assign_attributes(users_params)
	 		if @user.save
	 			redirect_to user_path(@user)
	 		else
	 			@errors = @user.errors.full_messages
 			end
 		else
 			render text: "Couldn't find what you were looking for", status: 404
 		end
 	end

 	def current
 		@current = current_user 
 		if request.xhr?
      		respond_to do |format|
        		format.json { render "users/current.json" }
      		end
    	end
 	end

	private

	def users_params
		params.require(:user).permit(:first_name,:last_name,:email, :password,:city, :state, :zip,:st_num, :st_name, :occupation, :education,:description )
	end
end
