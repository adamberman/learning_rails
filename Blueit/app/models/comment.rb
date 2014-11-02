class Comment < ActiveRecord::Base
	validates :content, :author, :post, presence: true

	belongs_to(
		:author,
		class_name: "User",
		foreign_key: :author_id,
		primary_key: :id
		)
	belongs_to :post
end