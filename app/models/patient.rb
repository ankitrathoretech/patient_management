class Patient < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  scope :relevant_soon, -> { where('next_appointment <= ?', 72.hours.from_now) }
end
