class Cat < ActiveRecord::Base
  validate :timeliness
  validates :color, inclusion: { in: %w[black brown calico orange],
            message: "Cats don't come in that color" }
  validates :name, :birth_date, :color, :sex, presence: true
  validates :sex, inclusion: { in: %w[M F], message: "Sex must be M or F" }
  
  def age
    ((Date::today - birth_date) / 365).to_i
  end
  private
  
  def timeliness
    if birth_date > Date::today
      errors[:days] << "Birthday cannot be after today"
    end
  end
end
