FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    isbn { Faker::Code.isbn }
    year { Faker::Number.between(from: 1900, to: 2021) }
    page_count { Faker::Number.between(from: 10, to: 1000) }
    published_on { Faker::Date.between(from: 100.years.ago, to: Time.zone.today) }
    language { 'PL' }

    author factory: %i[author]
    category factory: %i[category]
    publisher factory: %i[publisher]
  end
end
