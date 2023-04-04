class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :author
  belongs_to :category
  belongs_to :publisher

  has_many :book_loans, dependent: :destroy
  has_many :book_reservations, dependent: :destroy

  def ongoing_loan
    book_loans.checked_out.last
  end

  def ongoing_reservation
    book_reservations.initialized.last
  end

  def reservation_available_for?(user)
    book_loans.checked_out.where.not(user:).any? && book_reservations.initialized.none?
  end

  def loan_available_for?(user)
    book_loans.checked_out.none? && book_reservations.initialized.where.not(user:).none?
  end

  def status_for(user)
    return 'available' if book_loans.checked_out.none? && book_reservations.initialized.none?

    [].tap do |arr|
      arr << "loaned (due date: #{ongoing_loan.due_date})" if ongoing_loan.present?
      arr << ' by you' if ongoing_loan&.user == user
      arr << '; reserved' if ongoing_reservation.present?
      arr << ' by you' if ongoing_reservation&.user == user
    end.join('')
  end
end
