class BookReservationsController < ApplicationController
  before_action :set_book_reservation, only: %i[cancel]
  before_action :prepare_book_reservation, only: %i[create]

  def create
    respond_to do |format|
      if @book_reservation.save
        format.html { redirect_to book_url(book), notice: flash_notice }
        format.json { render :show, status: :created, location: @book_reservation }
      else
        format.html { redirect_to book_url(book), alert: @book_reservation.errors.full_messages.join(', ') }
        format.json { render json: @book_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    respond_to do |format|
      if @book_reservation.cancelled!
        format.html { redirect_to book_requests_path, notice: flash_notice }
        format.json { render :show, status: :ok, location: book }
      end
    end
  end

  private

  delegate :book, to: :@book_reservation

  def prepare_book_reservation
    @book_reservation = current_user.book_reservations.new(book_id: book_reservation_params)
  end

  def set_book_reservation
    @book_reservation = current_user.book_reservations.find(params[:id])
  end

  def book_reservation_params
    params.require(:book_id)
  end
end
