defmodule SubscribexExample.Application do
  use Application
  import Supervisor.Spec

  @moduledoc """
  Root SubscribexExample module
  """

  def start(_type, _args) do
    broker_consumers = [SubscribexExample.Queue1Subscriber]
    another_broker_consumers = [SubscribexExample.Queue2Subscriber]

    children = [
      supervisor(SubscribexExample.Broker, [broker_consumers]),
      supervisor(SubscribexExample.AnotherBroker, [another_broker_consumers])
    ]

    opts = [strategy: :one_for_one, name: SubscribexExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
