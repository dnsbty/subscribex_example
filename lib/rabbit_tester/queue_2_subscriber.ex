defmodule SubscribexExample.Queue2Subscriber do
  use Subscribex.Subscriber

  def init do
    config = %Config{
      broker: SubscribexExample.Broker,
      queue: "queue_2.key_2",
      exchange: "my_exchange",
      exchange_type: :topic,
      binding_opts: [routing_key: "key_2"]
    }

    {:ok, config}
  end

  def handle_payload(payload, _channel, _delivery_tag, _redelivered) do
    Logger.info("Received message from key_2: #{inspect(payload)}")
  end

  def handle_error(payload, channel, delivery_tag, error) do
    Logger.error("Raised #{inspect(error)} handling #{inspect(payload)}")
    reject(channel, delivery_tag, requeue: false)
  end
end
