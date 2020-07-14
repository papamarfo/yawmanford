defmodule Yawmanford do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Web.Router, options: [port: String.to_integer(System.get_env("PORT") || "4000")]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
