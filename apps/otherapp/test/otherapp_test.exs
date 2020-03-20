defmodule OtherappTest do
  use ExUnit.Case
  doctest Otherapp

  test "greets the world" do
    assert Otherapp.hello() == :world
  end
end
