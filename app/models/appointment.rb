class Appointment < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, completed: 2, canceled: 3 }

  belongs_to :tutor_profile
  belongs_to :student, class_name: "User", foreign_key: "student_id"

  validates :tutor_profile_id, presence: true
  validates :student_id, presence: true
  validates :appointment_time, presence: true
end
