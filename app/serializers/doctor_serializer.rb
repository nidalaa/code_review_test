# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  attributes :name, :category, :description, :fee, :exp, :likes, :phone, :address, :image
end
