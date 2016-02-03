class SessionsController < ApplicationController
	
	# before_action :authenticate_user!, except: [:create, :new]
	
	def new
	end

	def create
	@user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])

	    session[:user_id] = @user.id
	    redirect_to user_path(@user)
    else
    	puts "Yoour Credentials don't match"
    	p @user
    	@error = "Your Credentials don't match"
      render :'sessions/new'
    	end
    end

	
	def destroy
		session[:user_id] = nil
		redirect_to '/' 
	end
end
	


