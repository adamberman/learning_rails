class Post < ActiveRecord::Base
  validates :title, :sub, :author, presence: true
  
  belongs_to :sub
end
