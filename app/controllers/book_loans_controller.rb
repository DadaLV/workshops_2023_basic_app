class BookLoansController < ApplicationController
  before_action :set_book_loan, only: %i[cancel]
  before_action :prepare_book_loan, only: %i[create]

  def create
    respond_to do |format|
      if @book_loan.save
        book_loan_id = @book_loan.id
        LoanCreatedJob.perform_async(book_loan_id)
        DueDateNotificationJob.perform_at(@book_loan.due_date - 1.day, book_loan_id)
        publish_log(@book_loan)
        format.html { redirect_to book_url(book), notice: flash_notice }
        format.json { render :show, status: :created, location: @book_loan }
        notice_calendar
      else
        format.html { redirect_to book_url(book), alert: @book_loan.errors.full_messages.join(', ') }
        format.json { render json: @book_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    respond_to do |format|
      if @book_loan.cancelled!
        event_id = @book_loan.event_id
        delete_calendar_event(event_id) if event_id.present?
        publish_loan_log(@book_loan)
        format.html { redirect_to book_requests_path, notice: flash_notice }
        format.json { render :show, status: :ok, location: book }
      end
    end
  end

  private

  delegate :book, to: :@book_loan

  def prepare_book_loan
    @book_loan = current_user.book_loans.new(book_id: book_loan_params, due_date: Time.zone.today + 14.days)
  end

  def set_book_loan
    @book_loan = current_user.book_loans.find(params[:id])
  end

  def book_loan_params
    params.require(:book_id)
  end

  def notice_calendar
    event = UserCalendarNotifier.new(current_user, book).insert_event
    event_id = event.id

    @book_loan.update(event_id:)
  end

  def delete_calendar_event(event_id)
    UserCalendarNotifier.new(current_user, @book_loan.book).delete_event(event_id)
  end

  def publish_log(book_loan)
    Publishers::LoanBookPublisher.new(book_loan.attributes).publish
  end

  def publish_loan_log(book_loan)
    Publishers::LoanBookPublisher.new(book_loan.attributes).publish_log
  end
end
