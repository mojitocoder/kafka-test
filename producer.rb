require 'rubygems'
require 'bundler/setup'
require "kafka"

kafka = Kafka.new(
  seed_brokers: ['localhost:9092'],
  client_id: "producer-1" # Set an optional client id in order to identify the client to Kafka
)

producer = kafka.producer(
  compression_codec: :gzip
)

counter = 0
loop do
  producer.produce(counter.to_s, topic: "test", partition: counter % 2)
  producer.deliver_messages
  sleep(1.0)
  counter = counter + 1
end

producer.shutdown
