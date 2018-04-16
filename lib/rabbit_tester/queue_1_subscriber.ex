defmodule SubscribexExample.Queue1Subscriber do
  use Subscribex.Subscriber

  def start_link do
    Logger.info("Starting queue 1 subscriber")
    Subscriber.start_link(__MODULE__)
  end

  def init do
    config = %Config{
      broker: SubscribexExample.Broker,
      queue: "queue_1.key",
      exchange: "my_exchange",
      exchange_type: :topic,
      binding_opts: [routing_key: "key"]
    }

    {:ok, config}
  end

  def handle_payload(payload, _channel, _delivery_tag, _redelivered) do
    Logger.info(inspect(payload))
  end

  def handle_error(payload, channel, delivery_tag, error) do
    Logger.error("Raised #{inspect(error)} handling #{inspect(payload)}")
    reject(channel, delivery_tag, requeue: false)
  end
end
