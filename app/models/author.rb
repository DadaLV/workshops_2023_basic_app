class Author < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true

  has_many :books, dependent: :destroy
end
