# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :listings
  has_one :tutor_profile
end
