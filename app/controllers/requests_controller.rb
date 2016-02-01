class RequestsController < ApplicationController

	

 	def create
 		@request = Request.new(request_params)
 		if @request.save
 			redirect_to request_path
 		else
 			render :'requests/new'
 			flash[:notice] = "Something went wrong"
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

 	private

 	def request_params
 		params.permit(:id,:sender_id,:receiver_id,:skill_id,:content)
 	end

end
