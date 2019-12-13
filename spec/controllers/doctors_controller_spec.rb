# frozen_string_literal: true

require 'rails_helper'

describe DoctorsController do
  subject { get :index }
  describe '#index' do
    it 'should return a success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :doctor, 2
      subject
      Doctor.recent.each_with_index do |doctor, index|
        expect(json_data[index]['attributes']).to eq(
          'name' => doctor.name,
          'category' => doctor.category,
          'description' => doctor.description,
          'fee' => doctor.fee,
          'exp' => doctor.exp,
          'likes' => doctor.likes,
          'phone' => doctor.phone,
          'address' => doctor.address,
          'image' => doctor.image
        )
      end
    end

    it 'should return doctors in an ascending order by date' do
      old_doctor = create :doctor
      new_doctor = create :doctor
      subject
      expect(json_data.first['id']).to eq(new_doctor.id.to_s)
      expect(json_data.last['id']).to eq(old_doctor.id.to_s)
    end
  end

  describe '#show' do
    let(:doctor) { create :doctor }
    subject { get :show, params: { id: doctor.id } }

    it 'should return a success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      subject
      expect(json_data['attributes']).to eq(
        'name' => doctor.name,
        'category' => doctor.category,
        'description' => doctor.description,
        'fee' => doctor.fee,
        'exp' => doctor.exp,
        'likes' => doctor.likes,
        'phone' => doctor.phone,
        'address' => doctor.address,
        'image' => doctor.image
      )
    end
  end
end
