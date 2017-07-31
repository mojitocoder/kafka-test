require 'rubygems'
require 'bundler/setup'
require "kafka"

kafka = Kafka.new(
  seed_brokers: ['localhost:9092'],
  client_id: "my-application" # Set an optional client id in order to identify the client to Kafka
)

consumer = kafka.consumer(group_id: 'idiophone')
trap("INT") { consumer.stop }

consumer.subscribe('test', start_from_beginning: true)

consumer.each_batch do |batch|
  puts "#{batch.messages.to_s}"
end
