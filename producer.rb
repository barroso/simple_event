# producer.rb
require "rdkafka"
require "json"
require "dotenv/load"
require "securerandom"

class EventProducer
  def initialize
    @config = {
      'bootstrap.servers': ENV["KAFKA_BOOTSTRAP_SERVERS"] || "kafka:9092",
      'client.id': "ruby-producer",
    }
    @producer = Rdkafka::Config.new(@config).producer
  end

  def publish(topic, message)
    begin
      delivery_report = @producer.produce(
        topic: topic,
        payload: message.to_json,
      )
      delivery_report.wait
      puts "Mensagem publicada no tópico '#{topic}'"
    rescue StandardError => e
      puts "Erro ao publicar mensagem: #{e.message}"
    end
  end

  def close
    @producer.close
  end
end
