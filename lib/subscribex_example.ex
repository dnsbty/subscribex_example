defmodule SubscribexExample do
  @moduledoc """
  Documentation for SubscribexExample.
  """
  alias SubscribexExample.Broker

  @exchange "my_exchange"
  @routing_key "key_1"

  @doc """
  Publish the given text to the `queue_1.key` queue

  ## Examples

      iex> SubscribexExample.publish("hi")
      :ok

  """
  def publish(text) do
    Broker.channel(fn(channel) ->
      Broker.publish(channel, @exchange, @routing_key, text)
    end)
  end
end
