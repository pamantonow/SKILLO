class SessionsController < ApplicationController
	




	def new
	end

	def create
		@user = User.find_by(email: session_params[:email])
		puts "========================"
		p @user.authenticate(session_params[:password])
		puts "========================"
    if @user && @user.authenticate(session_params[:password])
	    session[:user_id] = @user.id
	    redirect_to user_path(@user)
    else
    	puts "Yoour Credentials don't match"
    	p @user
    	flash[:notice] = "Yoour Credentials don't match"
      render :'sessions/new'
    	end
    end

	
	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

	private

  def session_params
    params.permit(:email, :password)
  end
end
