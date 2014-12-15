class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w[PENDING APPROVED DENIED]
  
  validates :start_date, :end_date, :cat_id, :status, presence: true
  validates :status, inclusion: { in: STATUSES,
     message: "Status must be PENDING, APPROVED, OR DENIED" }
  validate :cat_rental_dates_do_not_overlap
  after_initialize :initialize_pending
  
  belongs_to :cat
  
  private
  
  def overlapping_requests
    overlapping_dates = []
    cat.cat_rental_requests.each do |request|
      if (start_date.between?(request.start_date, request.end_date) ||
        end_date.between?(request.start_date, request.end_date)) ||
        (start_date < request.start_date && end_date > request.end_date)
        overlapping_dates << request
      end
      
      overlapping_dates
    end
  end
  
  def cat_rental_dates_do_not_overlap
    if overlapping_requests.any? { |request| request.status == "APPROVED" } &&
        status == "APPROVED"
      errors[:overlap_dates] = "This cat is booked on these dates"
    end
  end
  
  def initialize_pending
    status ||= "PENDING"
  end
    
  
end
