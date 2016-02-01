class MessagesController < ApplicationController

	before_action :authenticate_user!

	def new
		@message = Message.new
		respond_to  do |format|
			format.html
			format.json { render json: @message }
			format.js
		end
	end


	def create
		@request = Request.find(params[:request_id])
		@new_message = @request.messages.new(message_params)
		@new_message.user = current_user
		if @new_message.save
			respond_to do |format|
			format.js
      format.html { redirect_to request_path(@request), notice: 'Message was sent successfully' }
		end
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

	private

	def message_params
		params.require(:message).permit(:content,:request_id)
	end
	
end
