class Track < ActiveRecord::Base
	validates :name, :album, :status, presence: true

	belongs_to :album

	def album_name
		album.name
	end
end
