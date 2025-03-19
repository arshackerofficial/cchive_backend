class TutorProfile < ApplicationRecord
  belongs_to :user
  has_many :appointments

  validates :subjects, presence: true
end
