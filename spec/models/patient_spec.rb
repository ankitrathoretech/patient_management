
require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it 'should not allow a past appointment date' do
    patient = build(:patient, next_appointment: 1.day.ago)
    expect(patient).not_to be_valid
  end

  it 'should allow future or present appointment dates' do
    patient = build(:patient, next_appointment: 1.day.from_now)
    expect(patient).to be_valid
  end
end
