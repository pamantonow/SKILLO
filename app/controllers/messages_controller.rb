class MessagesController < ApplicationController

	def new
		@message = Message.new
		respond_to  do |format|
		format.html
		format.js
		end
	end


	def create
		@message = Message.find(params[:id])
		respond_to do |format|
		@new_message = @message.request.new(message_params)
		if @new_message.save
      format.html { redirect_to request_path, notice: 'Message was sent successfully' }
		else
			flash[:notice] = "something went wrong"
			render :'messages/new'
		end
	end

	def show
		@request = Request.find(params[:id])
		@messages = @request.messages
		render :'messages/show'
	end
	
end
