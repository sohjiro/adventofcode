defmodule Adventofcode.Seventeen.Day02Test do
  use ExUnit.Case

  test "Given an U should move one position UP" do
    result = Adventofcode.Seventeen.Day02.instructions_to_axis "U"
    assert result == [{-1, 0}]
  end

  test "Given an D should move one position DOWN" do
    result = Adventofcode.Seventeen.Day02.instructions_to_axis "D"
    assert result == [{1, 0}]
  end

  test "Given an L should move one position LEFT" do
    result = Adventofcode.Seventeen.Day02.instructions_to_axis "L"
    assert result == [{0, -1}]
  end

  test "Given an R should move one position RIGHT" do
    result = Adventofcode.Seventeen.Day02.instructions_to_axis "R"
    assert result == [{0, 1}]
  end

  test "Given a couple of instructions should return a list of axis" do
    result = Adventofcode.Seventeen.Day02.instructions_to_axis "ULDR"
    assert result == [{-1, 0}, {0, -1}, {1, 0}, {0, 1}]
  end

  test "Given a list of axis should return a code number" do
    result = Adventofcode.Seventeen.Day02.calculate_number [{-1, 0}, {0, -1}, {1, 0}, {0, 1}, {1, 0}]
    assert result == 8
  end

  test "Given a string of instructions, should convert to a keypad number" do
    result = Adventofcode.Seventeen.Day02.keypad "ULD"
    assert result == 4
  end

  test "Given a string of instructions, should handle invalid directions" do
    result = Adventofcode.Seventeen.Day02.keypad "UUU"
    assert result == 2

    result = Adventofcode.Seventeen.Day02.keypad "LLL"
    assert result == 4

    result = Adventofcode.Seventeen.Day02.keypad "RRR"
    assert result == 6

    result = Adventofcode.Seventeen.Day02.keypad "DDD"
    assert result == 8
  end

  test "Given a string of instructions, should return two numbers" do
    result = Adventofcode.Seventeen.Day02.break_number "ULL\nRRDDD"
    assert result == [1, 9]
  end

end
