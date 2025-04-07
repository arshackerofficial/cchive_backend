# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  before_validation :set_default_username, on: :create

  # validations
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validate :must_be_columbia_student_email, on: :create

  has_many :listings, dependent: :destroy
  has_one :tutor_profile, dependent: :destroy
  has_many :student_appointments, class_name: "Appointment", foreign_key: "student_id", dependent: :destroy

  has_many :created_study_groups, class_name: "StudyGroup", foreign_key: "creator_id", dependent: :destroy
  has_many :study_group_memberships, dependent: :destroy
  has_many :study_groups, through: :study_group_memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  private

  def must_be_columbia_student_email
    unless email.match?(/\A\d+@columbiacollege\.ca\z/)
      errors.add(:email, "must be a valid Columbia College student email")
    end
  end
  def set_default_username
    if username.blank? && email.match?(/\A\d+@columbiacollege\.ca\z/)
      self.username = email.split("@").first
    end
  end
end
