class Patient < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validate :check_appointment_date

  scope :relevant_soon, -> { where('next_appointment <= ?', 72.hours.from_now) }

  scope :search_by_name_or_email, ->(query) {
    where("first_name ILIKE ? OR email ILIKE ?", "%#{query}%", "%#{query}%") if query.present?
  }

  def full_name
    self.first_name + " " + self.last_name
  end

  private

  def check_appointment_date
    if next_appointment.present? && next_appointment < Time.current
      errors.add(:next_appointment, "can't be in the past")
    end
  end
end
