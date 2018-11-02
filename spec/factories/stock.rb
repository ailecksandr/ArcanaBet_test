# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    name       { Faker::Beer.hop }
    interest   { Faker::Number.between(1, 100) / 100.0 }
    duration   { Faker::Number.between(1, 20) }
    unit_price { Faker::Number.between(100, 1000) }
  end
end
