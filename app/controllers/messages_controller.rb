class MessagesController < ApplicationController

	def new
		render :'messages/new'
	end


	def create
		@request = Request.find(params[:id])
		@messages = @request.messages(messages_params)
		if @messages.save
			redirect_to request_path
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
