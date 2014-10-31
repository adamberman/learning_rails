class TracksController < ApplicationController

	def new
		@track = Track.new
		@albums = Album.all
		@owner_album = Album.find(params[:album_id]) 
		render :new
	end

	def create
		@track = Track.new(track_params)
		@albums = Album.all 
		@owner_album = Album.find(params[:track][:album_id])
		if @track.save
			redirect_to track_url(@track)
		else
			render :new
		end
	end

	def show
		@track = Track.find(params[:id])
		render :show
	end

	def index
		@tracks = Track.all
		render :index
	end

	def destroy
		track = Track.find(params[:id])
		track.destroy
	end

	private

	def track_params
		params.require(:track).permit(:name, :album_id, :status, :lyrics)
	end
end