class RequestController < ApplicationController

	

 	def create
 		@request = Request.new(request_params)
 		if @request.save
 			redirect_to request_path
 		else
 			render :'request/new'
 			flash[:notice] = "Something went wrong"
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

 	private

 	def request_params
 		params.permit(:id,:sender_id,:receiver_id,:skill_id,:content)
 	end

end
