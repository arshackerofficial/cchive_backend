class TutorProfile < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :subjects, presence: true
end
