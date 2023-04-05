require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#validations' do
    let(:book) { build(:book) }

    context 'when factory is valid' do
      specify { expect(book).to be_valid }
    end

    context 'when model has invalid data' do
      let(:book) { build(:book, title: nil) }

      specify do
        expect(book).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:publisher) }
  end

  describe '#status_for' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }

    context 'when book is available' do
      specify { expect(book.status_for(user)).to eql('available') }
    end

    context 'when book is already loaned by user' do
      before do
        book.book_loans.create(user:, due_date: 1.day.from_now)
      end

      specify { expect(book.status_for(user)).to eql("loaned (due date: #{1.day.from_now.to_date}) by you") }

      context 'when book is also reserved by another user' do
        let(:user2) { create(:user) }

        before do
          book.book_reservations.create(user: user2)
        end

        specify do
          expect(book.status_for(user)).to eql("loaned (due date: #{1.day.from_now.to_date}) by you; reserved")
        end
      end
    end

    context 'when book is already loaned by another user' do
      let(:user2) { create(:user) }

      before do
        book.book_loans.create(user: user2, due_date: 1.day.from_now)
      end

      specify { expect(book.status_for(user)).to eql("loaned (due date: #{1.day.from_now.to_date})") }

      context 'when book is also reserved by you' do
        before do
          book.book_reservations.create(user:)
        end

        specify do
          expect(book.status_for(user)).to eql("loaned (due date: #{1.day.from_now.to_date}); reserved by you")
        end
      end
    end
  end
end
