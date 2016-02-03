class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

 	def current_user
		@current_user ||= User.find_by(id: 1 )
	end

	def user_id
		current_user.id
	end

	def authenticate_user!
		unless current_user 
			redirect_to login_path
		end
	end


	# def authenticate_action
	# 	if current_user && user_id != params[:id]
	# 		redirect_to login_path
	# 	end
	# end


end
