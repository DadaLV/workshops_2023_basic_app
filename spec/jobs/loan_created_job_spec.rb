require 'rails_helper'

RSpec.describe LoanCreatedJob do
  it 'sends a loan created email' do
    book_loan = create(:book_loan)
    expect {
      LoanCreatedJob.new.perform(book_loan.id)
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
