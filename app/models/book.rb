# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :author
  belongs_to :category
  belongs_to :publisher
end
