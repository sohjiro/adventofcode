defmodule Adventofcode.Day05Test do
  use ExUnit.Case
  doctest Adventofcode.Day05

  test "the string 'ugknbfddgicrmopn' is nice" do
    result = Adventofcode.Day05.nice_string?("ugknbfddgicrmopn")
    assert result == :nice
  end

  test "the string should not contain the strings ab, cd, pq, or xy" do
    result = Adventofcode.Day05.nice_string?("haegwjzuvuyypxyu")
    assert result == :naughty
  end

  test "the string 'jchzalrnumimnmhp' should be naughty" do
    result = Adventofcode.Day05.nice_string?("jchzalrnumimnmhp")
    assert result == :naughty
  end

  test "the string 'dvszwmarrgswjxmb' should be naughty" do
    result = Adventofcode.Day05.nice_string?("dvszwmarrgswjxmb")
    assert result == :naughty
  end

  test "given a list of strings should return the number of nice strings" do
    list = ["ugknbfddgicrmopn", "haegwjzuvuyypxyu", "jchzalrnumimnmhp", "dvszwmarrgswjxmb"]
    result = Adventofcode.Day05.count_nice_strings(list)
    assert result == 1
  end

end
