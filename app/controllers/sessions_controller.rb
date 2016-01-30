class SessionsController < ApplicationController
	


	def new
		render :'sessions/new'
	end

	def create
		p params
		@user = User.find_by(email: session_params[:email])
		p @user
    if @user && @user.authenticate(session_params[:password])
	    session[:user_id] = @user.id
	    p session[:user_id]
	    redirect_to user_path(@user)
    else
    	p @user
    	puts "-----------"
    	p "Credentials don't match"

    	puts "++++++++++"
      render :'sessions/new'
    	end
    end

		# @user = User.authenticate(params[:email], params[:password])
		# if @user
		# puts "----------"
		# 	p @user
		# 	 session[:user_id] = @user.id
		# 	puts "++++++++++++"
			

		# 	 redirect_to user_path
	# 	else
	# 		p @user
	# 		p "Credentials don't match"
	# 		flash[:notice] = "Credentials don't match"
	# 		render :'sessions/new'
	# 	end
	# end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

	private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
