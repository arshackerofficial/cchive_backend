# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :listings
  has_one :tutor_profile
  has_many :student_appointments, class_name: "Appointment", foreign_key: "student_id"

  has_many :created_study_groups, class_name: "StudyGroup", foreign_key: "creator_id"
  has_many :study_group_memberships
  has_many :study_groups, through: :study_group_memberships

  has_many :messages
end
