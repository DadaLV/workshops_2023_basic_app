FactoryBot.define do
  factory :book_loan do
    association :user, factory: :user
    association :book, factory: :book
    due_date { Time.zone.today + 14.days }
    event_id { 321321 }
    book_id { create(:book).id }
  end
end
