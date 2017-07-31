# README

Install Kafka: `brew install kafka`

Configure Kafka: uncomment `delete.topic.enable=true` in `/usr/local/etc/kafka/server.properties`

```shell
# Start Zookeper and Kafka
zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties & kafka-server-start /usr/local/etc/kafka/server.properties
```

Setup topic:

```shell
export KAFKA_HOME=/usr/local/Cellar/kafka/0.11.0.0
$KAFKA_HOME/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic test
$KAFKA_HOME/bin/kafka-topics --list --zookeeper localhost:2181

# Logs are in /usr/local/var/lib/kafka-logs
```

Start one producer and two consumers in the same consumer group in different shells:

```shell
ruby consumer.rb
ruby consumer.rb
ruby producer.rb
```

Optional cleanup:

```shell
$KAFKA_HOME/bin/kafka-topics --delete --zookeeper localhost:2181 --topic test # delete test topic
$KAFKA_HOME/bin/kafka-topics --list --zookeeper localhost:2181
```
