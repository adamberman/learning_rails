class BandsController < ApplicationController
	def new
		@band = Band.new
		render :new
	end

	def create
		@band = Band.new(band_params)
		if @band.save
			redirect_to band_url(@band)
		else
			render new
		end
	end

	def show
		@band = Band.find(params[:id])
		@albums = @band.albums
		render :show
	end

	def index
		@bands = Band.all
		render :index
	end

	def destroy
		Band.find(params[:id]).destroy
	end

	private

	def band_params
		params.require(:band).permit(:name)
	end
end