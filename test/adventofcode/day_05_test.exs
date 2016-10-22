defmodule Adventofcode.Day05Test do
  use ExUnit.Case
  doctest Adventofcode.Day05

  test "The string 'qjhvhtzxzqqjkmpb' should be nice" do
    [{string, result}] = Adventofcode.Day05.new_nice_string("qjhvhtzxzqqjkmpb")

    assert "qjhvhtzxzqqjkmpb" == string
    assert result == :nice
  end

  test "The string 'xxyxx' should be nice" do
    [{string, result}] = Adventofcode.Day05.new_nice_string("xxyxx")

    assert "xxyxx" == string
    assert result == :nice
  end

  test "The string 'uurcxstgmygtbstg' should be naughty" do
    [{string, result}] = Adventofcode.Day05.new_nice_string("uurcxstgmygtbstg")

    assert "uurcxstgmygtbstg" == string
    assert result == :naughty
  end

  test "The string 'ieodomkazucvgmuy' should be naughty" do
    [{string, result}] = Adventofcode.Day05.new_nice_string("ieodomkazucvgmuy")

    assert "ieodomkazucvgmuy" == string
    assert result == :naughty
  end

  test "given a list of strings should return the number of new nice strings" do
    strings = "rxexcbwhiywwwwnu"
    [{string, result}] = Adventofcode.Day05.new_nice_string(strings)
    assert result == :nice
  end

end
