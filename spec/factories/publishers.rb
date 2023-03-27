# frozen_string_literal: true

FactoryBot.define do
  factory :publisher do
    name { Faker::Book.publisher }
  end
end
