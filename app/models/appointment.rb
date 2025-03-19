class Appointment < ApplicationRecord
  belongs_to :tutor_profile
  belongs_to :student

  validates :tutor_profile_id, presence: true
  validates :student_id, presence: true
  validates :appointment_time, presence: true
end
