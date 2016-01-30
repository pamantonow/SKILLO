class SessionsController < ApplicationController
	



	def new
		render :'sessions/new'
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to new_user_skill_path
		else
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
