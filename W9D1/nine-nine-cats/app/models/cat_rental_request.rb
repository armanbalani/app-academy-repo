class CatRentalRequest < ApplicationRecord
  belongs_to :cat

  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :cat_id, presence: true
  validate :does_not_overlap_approved_request

  def overlapping_requests
    start_a = self.start_date
    end_a = self.end_date
    self_id = self.id
    if !id.nil?
      CatRentalRequest.where('(? <= end_date) AND (? >= start_date) AND cat_id = ? AND NOT (? = id)', start_a, end_a, self.cat_id, self_id)
    else
      CatRentalRequest.where('(? <= end_date) AND (? >= start_date) AND cat_id = ?', start_a, end_a, self.cat_id)
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = ?", "PENDING")
  end

  def approve!
    raise "not a pending request" unless self.status == "PENDING"
    transaction do 
      self.status = "APPROVED"
      self.save!
      self.overlapping_pending_requests.each do |request|
        request.update!(status: "DENIED")
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = ?", "APPROVED")
  end

  def denied?
    self.status == "DENIED"
  end

  def does_not_overlap_approved_request
    return if self.denied?
    if overlapping_approved_requests.exists?
      errors[:base] << "dates conflict with existing record"
    end
  end

end
