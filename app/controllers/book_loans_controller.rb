class BookLoansController < ApplicationController
  before_action :set_book_loan, only: %i[cancel]

  def create
    @book_loan = current_user.book_loans.new(book_id: book_loan_params, due_date: Time.zone.today + 14.days)

    respond_to do |format|
      if @book_loan.save
        format.html { redirect_to book_url(@book_loan.book), notice: 'Book Loan was successfully created.' }
        format.json { render :show, status: :created, location: @book_loan }
      else
        format.html { redirect_to book_url(@book_loan.book), alert: @book_loan.errors.full_messages.join(', ') }
        format.json { render json: @book_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    respond_to do |format|
      if @book_loan.cancelled!
        format.html { redirect_to book_requests_path, notice: 'Book loan was successfully cancelled.' }
        format.json { render :show, status: :ok, location: @book_loan.book }
      end
    end
  end

  private

  def set_book_loan
    @book_loan = current_user.book_loans.find(params[:id])
  end

  def book_loan_params
    params.require(:book_id)
  end
end
