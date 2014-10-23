class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :presence => true, :uniqueness => true
  validates :short_url, :presence => true, :uniqueness => true
  validates :submitter_id, :presence => true
  
  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )
  
  has_many(
    :visits,
    :class_name => 'Visit',
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )
  
  has_many :visitors, -> { distinct }, :through => :visits, :source => :user
  
  
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
  
  def num_clicks
    visits.count
  end
  
  def num_uniques
    visitors.count
  end
  
  def num_recent_uniques
    visitors.where(created_at: 10.minutes.ago..Time.now).distinct.count
    # .where('created_at >= ?', something)
  end
  
end