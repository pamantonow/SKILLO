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
 			@skill = Skill.find(params[:id])
 			@request = @skill.requests.find(params[:id])
 			render :'request/show'
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
