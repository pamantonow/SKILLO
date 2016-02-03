class CollectionsController < ApplicationController

	before_action :authenticate_user!

	def new
	end

	def edit
		@collection = Collection.find(params[:id])
		if !current_user?(@collection.teacher)
			redirect_to current_user
		end
	end

	def update
		@collection = Collection.find(params[:id])
		if current_user?(@collection.teacher)
			@collection.assign_attributes(params_collection)
			@collection.assign_attributes(years_of_experience: @collection.years_of_experience.to_i)
			@collection.assign_attributes(hourly_rate: @collection.hourly_rate.to_i)
			if @collection.save
	      redirect_to current_user
	    else
	    	render 'edit'
			end
		else
			redirect_to current_user
		end
	end

	def destroy
		@collection = Collection.find(params[:id])
		if current_user?(@collection.teacher)
			if @collection.destroy
				redirect_to current_user
			else
				redirect_to :back
			end
		else
			redirect_to current_user
		end
	end

	private

	def params_collection
		params.require(:collection).permit(:description, :years_of_experience, :hourly_rate)
	end


end

