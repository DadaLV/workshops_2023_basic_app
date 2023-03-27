# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times { Category.create(name: Faker::Book.genre) }
10.times { Publisher.create(name: Faker::Book.publisher) }
10.times { Author.create(name: Faker::Book.author.split(' ').first, surname: Faker::Book.author.split(' ').last) }

10.times do
  Book.create(
    title: Faker::Book.title,
    isbn: Faker::Code.isbn,
    year: Faker::Number.between(from: 1900, to: 2021),
    page_count: Faker::Number.between(from: 10, to: 1000),
    published_on: Faker::Date.between(from: 100.years.ago, to: Time.zone.today),
    language: 'PLN',
    author_id: Author.all.sample.id,
    category_id: Category.all.sample.id,
    publisher_id: Publisher.all.sample.id
  )
end
