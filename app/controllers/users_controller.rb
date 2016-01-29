class UsersController < ApplicationController

	def index
	end

	def new 
		render :'users/new'
	end

	def create
		@user = User.new(users_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to login_path
		else
			render :'users/new'
			@errors = @user.errors.full_messages
		end
	end

	private

	def users_params
		params.require(:users).permit(:first_name,:last_name,:email, :password,:city, :state, :zip,:st_num, :st_name )
	end

end
