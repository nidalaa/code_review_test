# frozen_string_literal: true

class AppointmentSerializer < ActiveModel::Serializer
  attributes :patient, :reason, :date, :time, :doctor
end
