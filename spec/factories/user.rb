# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { SecureRandom.base64(8) }
    password_confirmation { password }

    trait :with_stocks do
      after :create do |user|
        create_list :stock, 5, user: user
      end
    end
  end
end
