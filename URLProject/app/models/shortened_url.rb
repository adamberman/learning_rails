class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :presence => true, :uniqueness => true
  validates :short_url, :presence => true, :uniqueness => true
  validates :submitter_id, :presence => true
  
  def self.random_code
    
    new_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(new_url)
      new_url = SecureRandom.urlsafe_base64
    end
    new_url
  end
  
  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
    :long_url => long_url,
    :short_url => self.random_code,
    :submitter_id => user.id
    )
  
  end
  
end