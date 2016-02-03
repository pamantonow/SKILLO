class SearchController < ApplicationController
	
	def create
		searched_skill = params[:search].strip.downcase
		searched_city =  params[:city].strip.downcase
		@users = []	
		if searched_city == ""
			@usersByCity = User.all
		else
			@results = []
			User.all.each do |user|
				next if user == current_user 
				if user.city.downcase == searched_city 
					@results << user
				end
			end
			@usersByCity = @results
		end
		if searched_skill != ""
			@usersByCity.each do |user|
				p '******************'
				# p user.first_name
				next if user == current_user 
				user.skills.each do |skill|
					p skill.name.downcase.strip
					if (skill.name.downcase.strip == searched_skill)
						p skill.name.downcase.strip
						p user.skills
						@users << user
					end
				end
			end
		else
			@users = @usersByCity
		end
		p '##########565657#####'
		p @users 
		if request.xhr?
      		respond_to do |format|
        		format.json { render 'search/index' }
      		end
      	end
 
	                   
		
	end


end