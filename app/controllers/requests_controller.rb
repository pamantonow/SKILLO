class RequestsController < ApplicationController

	def new
		@request = Request.new
	end

	# POST /requests
	# POST /users/:user_id/skills/:skill_id/reqeusts
 	def create
 		@request = Request.new(request_params)
 		@request.sender_id = user_id
 		@request.receiver_id = params[:user_id]
 		@request.skill_id = params[:skill_id]
		respond_to do |format|
	 		if @request.save
 				format.html { redirect_to request_path(@request) }
 				format.js
	 		else
	 			flash[:error] = @request.errors
	 			render user_path
	 		end
	 	end
 	end

 	def show
 		if current_user
 			@request = Request.find(params[:id])
 			@messages = @request.messages
 			@message = Message.new
 			render :'requests/show'
 		else
 			redirect_to login_path
 		end
 	end

 	def edit

 	end

 	private

 	def request_params
 		params.require(:request).permit(:receiver_id, :skill_id, :content)
 	end

end
