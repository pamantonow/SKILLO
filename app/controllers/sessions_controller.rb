class SessionsController < ApplicationController
	


	def new
		render :'sessions/new'
	end

	def create
		@user = User.authenticate(params[:email], params[:password])
		if @user
			 session[:user_id] = @user.id
			 redirect_to user_path
			 puts "----------"
			p @user
			puts "+++=+++++++++"
		else
			flash[:notice] = "Credentials don't match"
			render :'sessions/new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
