class AlbumsController < ApplicationController

	def new
		@album = Album.new
		@bands = Band.all
		@band = Band.find(params[:band_id])
		render :new
	end

	def show
	end

	def create
	end

	def index
	end

	def destroy
	end

	private

	def album_params
	end
end