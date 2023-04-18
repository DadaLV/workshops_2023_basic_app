class BookReservation < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: { initialized: 'initialized', cancelled: 'cancelled', fulfilled: 'fulfilled' }

  validate :reservation_not_available, on: :create

  def reservation_not_available
    errors.add(:book, 'reservation is not available for you') unless book.reservation_available_for?(user)
  end

  def by_user?(user)
    self.user == user
  end
end
