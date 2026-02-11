defmodule PandadocExTest do
  use ExUnit.Case
  doctest PandadocEx

  test "greets the world" do
    assert PandadocEx.hello() == :world
  end
end
