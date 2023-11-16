require 'bunny'

module Publishers 
  class Application
    def initialize(routing_key:, exchange_name:, message:)
      @routing_key = routing_key
      @exchange_name = exchange_name
      @message = message
    end
    
    def perform
      connection.start
      channel = connection.create_channel
      exchange = channel.direct(@exchange_name)
      exchange.publish(@message.to_json, routing_key: @routing_key)
      connection.close
    end

    private

    attr_reader :message, :exchange_name, :routing_key
    
    def connection 
      @connection ||= Bunny.new(A9n.rabbitmq_connection_options).tap(&:start)      
    end
  end
end
