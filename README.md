# Simple Event: Ruby and Kafka Integration

This project demonstrates basic integration between Ruby and Apache Kafka using the `rdkafka` gem. It provides examples of both producing and consuming messages from a Kafka topic.

## Overview

This simple application showcases the fundamental principles of event-driven architectures with Kafka:

*   **Producers:** Generate events (messages) and publish them to a Kafka topic.
*   **Consumers:** Subscribe to a Kafka topic and process the incoming events.

This project is intended for educational purposes and can serve as a starting point for building more complex Kafka-based systems in Ruby.

## Prerequisites

Before you begin, ensure you have the following installed:

*   **Ruby:** Version 2.7 or higher
*   **Bundler:**  To manage Ruby dependencies (`gem install bundler`)
*   **Kafka Broker:** A running Kafka instance. You can use a local Kafka setup or a cloud-based Kafka service. (Make sure to have access to the bootstrap servers)

## Getting Started

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/barroso/simple_event.git
    cd simple_event
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Configuration:**

    *   **Kafka Connection:** You'll need to configure the connection to your Kafka broker. The project uses the following environment variables (you can set them directly in your shell or via a `.env` file):
        *   `KAFKA_BOOTSTRAP_SERVERS`: Comma-separated list of your Kafka brokers (e.g., `localhost:9092`).
        *   `KAFKA_TOPIC`: The name of the Kafka topic you will use. (e.g., `my_topic`).

        **Example with .env file:**
        Create a file named `.env` in the root directory and add the following, adjusting with your kafka broker:
            ```
            KAFKA_BOOTSTRAP_SERVERS=localhost:9092
            KAFKA_TOPIC=my_topic
            ```
            If you are using a .env file remember to install `gem install dotenv`
4.  **Running the Producer:**

    To publish messages to the Kafka topic, run:

    ```bash
    bundle exec ruby producer.rb
    ```

    This will continuously produce messages to the specified topic, incrementing a sequence number. You can stop this process with `Ctrl+C`.

5.  **Running the Consumer:**

    To start consuming messages from the Kafka topic, run:

    ```bash
    bundle exec ruby consumer.rb
    ```

    The consumer will subscribe to the configured topic and print each received message to the console. You can stop this process with `Ctrl+C`.

## Project Structure

*   **`producer.rb`:** Contains the code for producing messages to a Kafka topic.
*   **`consumer.rb`:** Contains the code for consuming messages from a Kafka topic.
*   **`Gemfile`:** Lists the Ruby gems used by the project.

## Key Concepts

*   **Kafka:** A distributed streaming platform for building real-time data pipelines and streaming applications.
*   **Topics:**  Named categories or feeds to which messages are published.
*   **Producers:** Applications that send messages to Kafka topics.
*   **Consumers:** Applications that subscribe to Kafka topics and receive messages.
*   **`rdkafka` gem:** A Ruby client library for interacting with Kafka.

## Further Exploration

*   **Error Handling:** Enhance the producer and consumer to handle potential errors, such as network issues or Kafka broker unavailability.
*   **Message Serialization:** Explore different message serialization formats (e.g., JSON, Avro) to handle more complex data structures.
*   **Partitioning:**  Learn about Kafka partitions and how they distribute data across brokers.
*   **Offset Management:** Understand how Kafka tracks consumed messages with offsets and how to configure consumer groups.
*   **Advanced Consumer Options:** Explore consumer group functionalities, and the many other ways a consumer can interact with Kafka (e.g. consumer lag)
