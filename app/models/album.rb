class Album < ActiveRecord::Base
	validates :name, :band, :style, presence: true

	belongs_to :band
	has_many :tracks, dependent: :destroy
end
