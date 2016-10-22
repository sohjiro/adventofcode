defmodule Adventofcode.Day05Test do
  use ExUnit.Case
  doctest Adventofcode.Day05

  test "the string 'ugknbfddgicrmopn' is nice" do
    result = Adventofcode.Day05.count_nice_strings("ugknbfddgicrmopn")
    assert result == 1
  end

  test "the string should not contain the strings ab, cd, pq, or xy" do
    result = Adventofcode.Day05.count_nice_strings("haegwjzuvuyypxyu")
    assert result == 0
  end

  test "the string 'jchzalrnumimnmhp' should be naughty" do
    result = Adventofcode.Day05.count_nice_strings("jchzalrnumimnmhp")
    assert result == 0
  end

  test "the string 'dvszwmarrgswjxmb' should be naughty" do
    result = Adventofcode.Day05.count_nice_strings("dvszwmarrgswjxmb")
    assert result == 0
  end

  test "given a list of strings should return the number of nice strings" do
    strings = "ugknbfddgicrmopn\nhaegwjzuvuyypxyu\njchzalrnumimnmhp\ndvszwmarrgswjxmb"
    result = Adventofcode.Day05.count_nice_strings(strings)
    assert result == 1
  end

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
    strings = "qjhvhtzxzqqjkmpb\nxxyxx\nuurcxstgmygtbstg\nieodomkazucvgmuy"
    result = Adventofcode.Day05.count_new_nice_strings(strings)
    assert result == 2
  end

end
