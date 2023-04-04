class BookRequestsController < ApplicationController
  def index
    @book_loans = current_user.book_loans
    @book_reservations = current_user.book_reservations
  end
end
