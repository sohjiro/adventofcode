defmodule Adventofcode.Day04Test do
  use ExUnit.Case
  doctest Adventofcode.Day04

  test "given a secret key 'abcdef' should find a number that generate a hash with at least five 0s" do
    {number, hash} = Adventofcode.Day04.find_number("abcdef")
    assert number == 609043
    assert "00000" <> _rest = hash
  end

  test "given a secret key 'pqrstuv' should find a number that generate a hash with at least five 0s" do
    {number, hash} = Adventofcode.Day04.find_number("pqrstuv")
    assert number == 1048970
    assert "00000" <> _rest = hash
  end

  test "given a secret key 'yzbqklnj' should find a number that generate a hash with at least six 0s" do
    {number, hash} = Adventofcode.Day04.hash_with_six_zeros("yzbqklnj")
    assert number == 9962624
    assert "000000" <> _rest = hash
  end
end
