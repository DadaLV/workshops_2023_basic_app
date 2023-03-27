json.extract! book, :id, :title, :isbn, :year, :page_count, :published_on, :language, :author_id, :category_id,
              :publisher_id, :created_at, :updated_at
json.url book_url(book, format: :json)
