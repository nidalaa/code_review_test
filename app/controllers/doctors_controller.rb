# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    doctors = Doctor.recent
    if filter_params
      render json: apply_filer(doctors)
    else
      doctors
    end
  end

  def apply_filer(doctors)
    doctors = doctors.filter_category(filter_params[:category]) if filter_params[:category]
    doctors = doctors.filter_name(filter_params[:name]) if filter_params[:name]
    doctors = doctors.filter_fee(filter_params[:fee]) if filter_params[:fee]
    doctors = doctors.filter_exp(filter_params[:exp]) if filter_params[:exp]
    doctors = doctors.filter_likes(filter_params[:likes]) if filter_params[:likes]
    doctors
  end

  def show
    render json: Doctor.find(params[:id])
  end

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.valid?
      doctor.save
      render json: doctor, status: :created
    else
      render json: doctor, serializer: ActiveModel::Serializer::ErrorSerializer, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:data)
      .require(:attributes)
      .permit(:name, :image, :category, :description, :fee, :exp, :likes, :phone, :address) ||
      ActionController::Parameters.new
  end

  def filter_params
    params[:filter]&.permit(:name, :category, :fee, :exp, :likes)
  end
end
