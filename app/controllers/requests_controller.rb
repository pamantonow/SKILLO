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
 			@skill = Skill.find(params[:id])
 			@request = @skill.requests.find(params[:id])
 			render :'requests/show'
 		else
 			redirect_to login_path
 		end
 	end

 	Request.create(sender_id: 2, skill_id: 1, content: "Hi , I will like to see if you are available next week for tutoring? I need to learn spanish for my finals")
 	private

 	def request_params
 		params.permit(:id,:sender_id,:receiver_id,:skill_id,:content)
 	end

end
