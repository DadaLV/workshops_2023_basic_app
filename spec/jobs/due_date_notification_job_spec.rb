require 'rails_helper'

RSpec.describe DueDateNotificationJob do
  it 'sends a due date notification email' do
    book_loan = create(:book_loan)

    expect {
      DueDateNotificationJob.new.perform(book_loan.id)
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
