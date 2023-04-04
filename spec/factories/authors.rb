FactoryBot.define do
  factory :author do
    name { Faker::Book.author.split(' ').first }
    surname { Faker::Book.author.split(' ').last }
  end
end
