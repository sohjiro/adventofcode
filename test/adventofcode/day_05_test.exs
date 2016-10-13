defmodule Adventofcode.Day05Test do
  use ExUnit.Case
  doctest Adventofcode.Day05

  test "the string should contain at least three vowels" do
    {vowels, _twice, _banned} = Adventofcode.Day05.nice_string?("aeiouaeiouaeiou")
    assert vowels > 2
  end

  test "the string should contain at least one letter that appears twice in a row" do
    {_vowels, twice, _banned} = Adventofcode.Day05.nice_string?("aabbccdd")
    assert twice
  end

  test "the string should not contain the strings ab, cd, pq, or xy" do
    {_vowels, _twice, banned} = Adventofcode.Day05.nice_string?("haegwjzuvuyypxyu")
    refute banned
  end

end
