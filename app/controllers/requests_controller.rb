class RequestsController < ApplicationController

	before_action :authenticate_user!

	def new
		@request = Request.new
	end

	def index
		@requested = current_user.received_requests
		@requests = current_user.sent_requests
	end
	
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
 			@messages = @request.messages.order(created_at: :desc)
 			@message = Message.new
 			render :'requests/show'
 		else
 			redirect_to login_path
 		end
 	end

 	def update
 		@request = Request.find(params[:id])
 		@request.accepted = true
 		@request.save
 		redirect_to @request
 	end

 	def destroy
 		@request = Request.find(params[:id])
 		@request.accepted = false
 		@request.save
 		redirect_to requests_path
 	end

 	private

 	def request_params
 		params.require(:request).permit(:receiver_id, :skill_id, :content)
 	end

end
