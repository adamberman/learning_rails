class AlbumsController < ApplicationController

	def new
		@album = Album.new
		@band = @album.band
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