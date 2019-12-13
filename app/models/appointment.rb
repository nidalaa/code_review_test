# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :patient
  validates_presence_of :reason

  def self.recent
    order(created_at: :desc)
  end
end
