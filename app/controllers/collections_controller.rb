class CollectionsController < ApplicationController
	
	before_action :authenticate_user!

	def edit
		@collection = Collection.find_by(id: params[:id])
	end

	def update
		@collection = Collection.find_by(id: params[:id])
		if @collection.update(params_collection)
      redirect_to current_user
    else
    	render 'edit'
		end
	end

	def new
	end


	private

	def params_collection
		params.require(:collection).permit(:hourly_rate, :years_of_expirience, :description)
	end

	
end

