# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :fee, presence: true
  validates :exp, presence: true
  validates :likes, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :image, presence: true

  def self.recent
    order(created_at: :desc)
  end

  def self.filter_category(filter)
    where(category: filter)
  end

  def self.filter_name(filter)
    where('name LIKE ?', "%#{filter}%")
  end

  def self.filter_fee(filter)
    where('fee <= ?', filter)
  end

  def self.filter_exp(filter)
    where('exp >= ?', filter)
  end

  def self.filter_likes(filter)
    where('likes >= ?', filter)
  end
end
