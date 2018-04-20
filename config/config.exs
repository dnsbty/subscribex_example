# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :rabbit_tester, SubscribexExample.Broker,
  rabbit_host: [
    username: "guest",
    password: "guest",
    host: "localhost",
    port: 5672
  ]

config :rabbit_tester, SubscribexExample.AnotherBroker, rabbit_host: "amqp://guest:guest@localhost:5672"
