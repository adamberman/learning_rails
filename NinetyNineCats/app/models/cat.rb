class Cat < ActiveRecord::Base
  COLORS = %w[black brown calico orange]
  
  validates :color, inclusion: { in: COLORS,
            message: "Cats don't come in that color" }
  validates :name, :birth_date, :color, :sex, presence: true
  validates :sex, inclusion: { in: %w[M F], message: "Sex must be M or F" }
  validate :birth_date_not_in_future
  
  has_many :cat_rental_requests, dependent: :destroy
  
  def age
    ((Date::today - birth_date) / 365).to_i
  end
  
  private
  
  def birth_date_not_in_future
    unless birth_date && birth_date < Date::today
      errors[:birth_day] << "Birthday cannot be in the future"
    end
  end
end
