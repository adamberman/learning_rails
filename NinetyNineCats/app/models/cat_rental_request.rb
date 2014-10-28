class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w[PENDING APPROVED DENIED]
  
  validates :start_date, :end_date, :cat_id_id, :status, presence: true
  validates :status, inclusion: { in: STATUSES,
     message: "Status must be PENDING, APPROVED, OR DENIED" }
  validate :cat_rental_dates_do_not_overlap
  
  belongs_to :cat
  
  private
  
  def cat_rental_dates_do_not_overlap
    if start_date
    end
  end
end
