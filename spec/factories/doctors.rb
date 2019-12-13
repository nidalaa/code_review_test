# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    sequence(:name) { |n| "MyString #{n}" }
    category { 'MyString' }
    description { 'MyText' }
    fee { 500 }
    exp { 200 }
    likes { 100 }
    phone { 'MyString' }
    address { 'MyString' }
    image { 'MyString' }
  end
end
