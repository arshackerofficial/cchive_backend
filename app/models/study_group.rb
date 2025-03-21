class StudyGroup < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :study_group_memberships
  has_many :users, through: :study_group_memberships

  has_many :messages
end
