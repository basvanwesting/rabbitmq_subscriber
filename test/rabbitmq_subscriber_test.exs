defmodule RabbitmqSubscriberTest do
  use ExUnit.Case
  doctest RabbitmqSubscriber

  test "greets the world" do
    assert RabbitmqSubscriber.hello() == :world
  end
end
