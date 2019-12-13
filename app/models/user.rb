# frozen_string_literal: true

class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  has_secure_password

  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email
end
