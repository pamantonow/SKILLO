class Category < ActiveRecord::Base
	has_many :skills

	def show
		@category = Category.find(params[:id])
		@category.skills.each do |skill|
			@teachers << skill.users
		end
		@users.flatten
	end
end
