class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :presence => true, :uniqueness => true
  validates :short_url, :presence => true, :uniqueness => true
  validates :submitter_id, :presence => true
end