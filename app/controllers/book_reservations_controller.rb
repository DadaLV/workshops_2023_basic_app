class BookReservationsController < ApplicationController
  before_action :set_book_reservation, only: %i[cancel]

  def create
    @book_reservation = current_user.book_reservations.new(book_id: book_reservation_params)

    respond_to do |format|
      if @book_reservation.save
        format.html do
          redirect_to book_url(@book_reservation.book), notice: 'Book Reservation was successfully created.'
        end
        format.json { render :show, status: :created, location: @book_reservation }
      else
        format.html do
          redirect_to book_url(@book_reservation.book), alert: @book_reservation.errors.full_messages.join(', ')
        end
        format.json { render json: @book_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    respond_to do |format|
      if @book_reservation.cancelled!
        format.html { redirect_to book_requests_path, notice: 'Book reservation was successfully cancelled.' }
        format.json { render :show, status: :ok, location: @book_reservation.book }
      end
    end
  end

  private

  def set_book_reservation
    @book_reservation = current_user.book_reservations.find(params[:id])
  end

  def book_reservation_params
    params.require(:book_id)
  end
end
