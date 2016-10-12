defmodule Adventofcode.Day04Test do
  use ExUnit.Case
  doctest Adventofcode.Day04

  test "" do
    number = Adventofcode.Day04.hash_of("abcdef")
    assert number == 609043
  end

end
