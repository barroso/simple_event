# performance_consumer.rb
require "rdkafka"
require "dotenv/load"
require "benchmark"
require "./consumer.rb"

MESSAGE_COUNT = 200
RECEIVED_COUNT = 0
start_time = nil
puts "Start Consumer..."
consumer = EventConsumer.new("ruby-consumer-group")
consumer.subscribe("user_events")

time = Benchmark.realtime do
  begin
    loop do
      puts "Consumer #{RECEIVED_COUNT}"
      message = consumer.consume
      if message
        RECEIVED_COUNT += 1
        if start_time.nil?
          start_time = Time.now
        end
        break if RECEIVED_COUNT >= MESSAGE_COUNT
      end
    end
  rescue Rdkafka::RdkafkaError::ERR__PARTITION_EOF
    # Ignore EOF, acontece quando um consumidor chega no final da partição.
    # O loop vai parar quando RECEIVE_COUNT for suficiente.
    puts "Finished consuming the partition."
  end
end

puts "Consumed #{RECEIVED_COUNT} messages in #{time.round(2)} seconds."
puts "Average consumption rate: #{(RECEIVED_COUNT / time).round(2)} messages/second"
