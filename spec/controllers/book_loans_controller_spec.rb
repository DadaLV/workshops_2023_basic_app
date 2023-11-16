require 'rails_helper'

RSpec.describe BookLoansController do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe 'Create book loan' do
    context 'with valid attributes' do
      it 'creates a new book loan' do
        sign_in user

        allow_any_instance_of(UserCalendarNotifier).to receive(:insert_event) do
          double(id: 'valid_event_id')
        end

        expect {
          post :create, params: { book_id: book.id }
        }.to change(BookLoan, :count).by(1)
      end

      it 'redirects to the book show page' do
        sign_in user

        allow_any_instance_of(UserCalendarNotifier).to receive(:insert_event) do
          double(id: 'valid_event_id')
        end

        post :create, params: { book_id: book.id }
        expect(response).to redirect_to(book_path(book))
      end
    end
  end

  describe 'Cancel book loan' do
    let(:book_loan) { create(:book_loan, user: user, book: book) }

    it 'cancels the book loan' do
      sign_in user
      delete :cancel, params: { id: book_loan.id }
      expect(book_loan.reload.cancelled?).to be true
    end

    it 'deletes the calendar event' do
      sign_in user
      expect_any_instance_of(UserCalendarNotifier).to receive(:delete_event)
      delete :cancel, params: { id: book_loan.id }
    end

    it 'redirects to the book requests path' do
      sign_in user
      delete :cancel, params: { id: book_loan.id }
      expect(response).to redirect_to(book_requests_path)
    end
  end
end
