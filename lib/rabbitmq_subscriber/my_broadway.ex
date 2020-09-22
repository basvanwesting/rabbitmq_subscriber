defmodule RabbitmqSubscriber.MyBroadway do
  use Broadway

  #alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: MyBroadway,
      producer: [
        module: {BroadwayRabbitMQ.Producer,
          queue: "broadway_tutorial",
          connection: [
            host: "bas-rpi4-161.local",
            username: "client",
            password: "client",
          ],
          qos: [
            prefetch_count: 50,
          ]
        },
        concurrency: 2
      ],
      processors: [
        default: [
          concurrency: 50
        ]
      ]
    )
  end

  @impl true
  def handle_message(_, message, _) do
    IO.inspect(message.data, label: "Got message")
    message
  end

end
