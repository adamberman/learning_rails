class Visit < ActiveRecord::Base
  validates :user, :presence => true
  validates :shortened_url, :presence => true
  
  belongs_to(
    :shortened_url,
    :class_name => 'ShortenedUrl',
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )
  
  belongs_to(
    :user,
    :class_name => 'User',
    :foreign_key => :user_id,
    :primary_key => :id
  )
  
  def self.record_visit!(user, shortened_url)
    Visit.create!(
      :user => user,
      :shortened_url => shortened_url
    )
  end
end

# v = Visit.new(options)
# v.user = options.user
# v.shortene_url = options.shortene_url
# v.valid?
# v.user.nil?
# v.shortene_url.nil?
# v.save!