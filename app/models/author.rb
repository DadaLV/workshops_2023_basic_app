class Author < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true

  has_many :books, dependent: :destroy

  def full_name
    "#{name} #{surname}"
  end
end
