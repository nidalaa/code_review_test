# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe '#validations' do
    it 'should test for a valid factory' do
      expect(build(:appointment)).to be_valid
    end

    it 'should validate the presence of patient' do
      appointment = build(:appointment, patient: '')
      expect(appointment).not_to be_valid
      expect(appointment.errors.messages[:patient]).to include("can't be blank")
    end

    it 'should validate the presence of reason' do
      appointment = build(:appointment, reason: '')
      expect(appointment).not_to be_valid
      expect(appointment.errors.messages[:reason]).to include("can't be blank")
    end

    it 'should validate the presence of date' do
      appointment = build(:appointment, date: '')
      expect(appointment).not_to be_valid
      expect(appointment.errors.messages[:date]).to include("can't be blank")
    end

    it 'should validate the presence of time' do
      appointment = build(:appointment, time: '')
      expect(appointment).not_to be_valid
      expect(appointment.errors.messages[:time]).to include("can't be blank")
    end

    it 'should validate the presence of doctor' do
      appointment = build(:appointment, doctor: nil)
      expect(appointment).not_to be_valid
      expect(appointment.errors.messages[:doctor]).to include('must exist')
    end

    it 'should validate the presence of user' do
      appointment = build(:appointment, user: nil)
      expect(appointment).not_to be_valid
      expect(appointment.errors.messages[:user]).to include('must exist')
    end
  end

  describe '.recent' do
    it 'should return recent appointment first' do
      old_appointment = create :appointment
      new_appointment = create :appointment
      expect(described_class.recent).to eq(
        [new_appointment, old_appointment]
      )
      old_appointment.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [old_appointment, new_appointment]
      )
    end
  end
end
