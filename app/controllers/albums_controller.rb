class AlbumsController < ApplicationController

	def new
		@album = Album.new
		@bands = Band.all
		@owner_band = Band.find(params[:band_id])
		render :new
	end

	def show
		@album = Album.find(params[:id])
		render :show
	end

	def create
		@bands = Band.all
		@album = Album.new(album_params)
		@owner_band = Band.find(params[:album][:band_id])
		if @album.save
			redirect_to albums_url(@album)
		else
			render :new
		end
	end

	def index
		@albums = Album.all
		render :index
	end

	def destroy
		album = Album.find(params[:id])
		album.destroy
	end

	private

	def album_params
		params.require(:album).permit(:name, :band_id, :style)
	end
end