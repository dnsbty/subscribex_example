defmodule SubscribexExample.Queue1Subscriber do
  use Subscribex.Subscriber

  def init do
    config = %Config{
      broker: SubscribexExample.Broker,
      queue: "queue_1.key_1",
      exchange: "my_exchange",
      exchange_type: :topic,
      binding_opts: [routing_key: "key_1"]
    }

    {:ok, config}
  end

  def handle_payload(payload, _channel, _delivery_tag, _redelivered) do
    Logger.info("Received message from key_1: #{inspect(payload)}")
  end

  def handle_error(payload, channel, delivery_tag, error) do
    Logger.error("Raised #{inspect(error)} handling #{inspect(payload)}")
    reject(channel, delivery_tag, requeue: false)
  end
end
