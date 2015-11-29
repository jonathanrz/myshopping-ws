class PlacesController < ApplicationController
	def index
		@places = Place.all
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.create(strong_params)

		if @place.persisted?
			redirect_to @place
		else
			render :new
		end
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])

		if @place.update_attributes(strong_params)
			redirect_to @place
		else
			render :edit
		end
	end

	def destroy
		@place = Place.find(params[:id])

		@place.destroy

		redirect_to places_url
	end

	def strong_params
		params.require(:place).permit([:name])
	end
end
