defmodule Adventofcode.Day05Test do
  use ExUnit.Case
  doctest Adventofcode.Day05

  test "the string 'aeiouaeiouaeiou' should be a nice string" do
    result = Adventofcode.Day05.nice_string?("aeiouaeiouaeiou")
    assert result > 2
  end

end
