class CatRentalRequest < ApplicationRecord
  belongs_to :cat

  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :cat_id, presence: true

  def overlapping_requests
    CatRentalRequest.where()

  end
end
