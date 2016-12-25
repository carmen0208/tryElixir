defmodule SchizoTest do
  use ExUnit.Case

  test "uppercase doesn't change the first word" do
    assert(Schizo.uppercase("foo") == "foo")
  end

  test "uppercase convert the second word to uppercase" do
    assert(Schizo.uppercase("foo bar") == "foo BAR")
  end

  test "uppercase converts every other word to uppercase" do
    assert(Schizo.uppercase("foo bar baz whee") == "foo BAR baz WHEE")
  end
end
