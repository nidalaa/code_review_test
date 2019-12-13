# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Smith' }
    sequence(:email) { |n| "User#{n}@email.com" }
    password_digest { 'MyString' }
  end
end
