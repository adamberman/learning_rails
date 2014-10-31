class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true
  validates :title, uniqueness: true
  
  has_many :posts, dependent: :destroy
  
  belongs_to(
    :moderator, 
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id
  )
end