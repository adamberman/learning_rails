class User < ActiveRecord::Base
  validates :username, presence: true
  
  has_one(
    :own_contact,
    class_name: "Contact",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :contact_shares,
    class_name: "ContactShare",
    foreign_key: :contact_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :contacts,
    through: :contact_shares,
    source: :contact
  )
end
