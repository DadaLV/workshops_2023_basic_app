require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:book_loan) { create(:book_loan) }

  describe 'loan_created_email' do
    it 'sends a loan created email' do
      mail = UserMailer.loan_created_email(book_loan)
      expect(mail.subject).to eq('Book Loan Confirmation')
      expect(mail.to).to eq([book_loan.user.email])
      expect(mail.body).to include("The due date for returning the book is #{book_loan.due_date.strftime('%B %d, %Y')}.")
    end
  end

  describe 'due_date_notification_email' do
    it 'sends a due date notification email' do
      mail = UserMailer.due_date_notification_email(book_loan)
      expect(mail.subject).to eq('Book returning')
      expect(mail.to).to eq([book_loan.user.email])
      expect(mail.body).to include(" to the library is #{book_loan.due_date.strftime('%B %d, %Y')}.")
    end
  end

  describe 'due_date_notification_cron_email' do
    it 'sends a due date notification cron email' do
      mail = UserMailer.due_date_notification_cron_email(book_loan)
      expect(mail.subject).to eq('Book returning CRON')
      expect(mail.to).to eq([book_loan.user.email])
      expect(mail.body).to include(" to the library is #{book_loan.due_date.strftime('%B %d, %Y')}.")
    end
  end
end
