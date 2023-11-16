module Publishers
  class LoanBookPublisher
    def initialize(message)
      @message = message
    end

    def publish
      ::Publishers::Application.new(
        routing_key: 'basic_app.book_loans',
        exchange_name: 'basic_app',
        message: message
      ).perform
    end

    def publish_log
      ::Publishers::Application.new(
        routing_key: 'basic_app.book_loan_logs',
        exchange_name: 'basic_app',
        message: message
      ).perform
    end

    attr_reader :message
  end
end
