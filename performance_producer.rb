# performance_producer.rb
require "rdkafka"
require "dotenv/load"
require "benchmark"
require "securerandom"
require "./producer.rb"

MESSAGE_COUNT = 200

producer = EventProducer.new
time = Benchmark.realtime do
  MESSAGE_COUNT.times do |i|
    puts "user_created #{i}"
    producer.publish("user_events", {
      event_type: "user_created",
      user_id: SecureRandom.uuid,
      timestamp: Time.now,
    })
    # Não precisa do producer.deliver_messages aqui, a rdkafka já envia quando o batch fica cheio
  end
  producer.close
end

puts "Produced #{MESSAGE_COUNT} messages in #{time.round(2)} seconds."
puts "Average production rate: #{(MESSAGE_COUNT / time).round(2)} messages/second"
