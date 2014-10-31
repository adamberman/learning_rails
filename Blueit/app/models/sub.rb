class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true
  validates :title, uniqueness: true
  
  has_many :posts
end
