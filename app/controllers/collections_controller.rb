class CollectionsController < ApplicationController

	before_action :authenticate_user!

	def new
	end

	def edit
		@collection = Collection.find(params[:id])
	end

	def update
		@collection = Collection.find(params[:id])
		@collection.assign_attributes(params_collection)
		@collection.assign_attributes(years_of_experience: @collection.years_of_experience.to_i)
		@collection.assign_attributes(hourly_rate: @collection.hourly_rate.to_i)
		if @collection.save
      redirect_to current_user
    else
    	render 'edit'
		end
	end

	def delete

	end

	private

	def params_collection
		params.require(:collection).permit(:description, :years_of_experience, :hourly_rate)
	end


end

