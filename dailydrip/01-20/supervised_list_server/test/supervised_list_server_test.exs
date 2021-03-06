
defmodule SupervisedListServerTest do
  use ExUnit.Case
  # import ListServer
  # import ListSupervisor
  doctest SupervisedListServer

  # Client the ListServer before each tast
  setup do
    ListServer.start_link
    ListServer.clear
  end


  test "it start out empty" do
    assert ListServer.items == []
  end

  test "it lets us add things to the list" do
    ListServer.add "book"
    assert ListServer.items == ["book"]
  end

  test "it lets us remove things from the list" do
    ListServer.add "book"
    ListServer.add "magazine"
    ListServer.remove "book"
    assert ListServer.items == ["magazine"]
  end

end
