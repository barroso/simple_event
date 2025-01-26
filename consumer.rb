# consumer.rb
require "rdkafka"
require "json"
require "dotenv/load"

class EventConsumer
  def initialize(group_id)
    puts "initialize eventConsumer"
    @config = {
      'bootstrap.servers': ENV["KAFKA_BOOTSTRAP_SERVERS"] || "localhost:9092",
      'group.id': group_id,
      'auto.offset.reset': "earliest",
    }
    @consumer = Rdkafka::Config.new(@config).consumer
  end

  def subscribe(topic) # Mudança: de array para string única
    @consumer.subscribe(topic)

    begin
      @consumer.each do |message|
        handle_message(message)
      end
    rescue Rdkafka::RdkafkaError => e
      puts "Erro no consumo: #{e.message}"
    ensure
      @consumer.close
    end
  end

  private

  def handle_message(message)
    puts "Tópico: #{message.topic}"
    puts "Partição: #{message.partition}"
    puts "Payload: #{message.payload}"

    begin
      parsed_payload = JSON.parse(message.payload)
      # Processamento específico baseado no tipo de evento
      case parsed_payload["event_type"]
      when "user_created"
        process_user_created(parsed_payload)
      else
        puts "Tipo de evento desconhecido"
      end
    rescue JSON::ParserError
      puts "Erro ao parsear mensagem"
    end
  end

  def process_user_created(payload)
    puts "Novo usuário criado: #{payload["user_id"]}"
    # Lógica de processamento do evento de criação de usuário
  end
end

# Exemplo de uso
consumer = EventConsumer.new("ruby-consumer-group")
consumer.subscribe("user_events")  # Passando string única
