FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    isbn { Faker::Code.isbn }
    year { Faker::Number.between(from: 1900, to: 2021) }
    page_count { Faker::Number.between(from: 10, to: 1000) }
    published_on { Faker::Date.between(from: 100.years.ago, to: Time.zone.today) }
    language { 'PL' }
    author { build(:author) }
    category { build(:category) }
    publisher { build(:publisher) }
  end
end
