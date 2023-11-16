class UserMailer < ApplicationMailer
  def loan_created_email(book_loan)
    @date = book_loan.due_date
    @title = book_loan.book.title
    @user = book_loan.user.email
    mail(to: book_loan.user.email, subject: "Book Loan Confirmation")
  end

  def due_date_notification_email(book_loan)
    @date = book_loan.due_date
    @title = book_loan.book.title
    @user = book_loan.user.email
    mail(to: book_loan.user.email, subject: "Book returning")
  end

  def due_date_notification_cron_email(book_loan)
    @date = book_loan.due_date
    @title = book_loan.book.title
    @user = book_loan.user.email
    mail(to: book_loan.user.email, subject: "Book returning CRON")
  end
end
