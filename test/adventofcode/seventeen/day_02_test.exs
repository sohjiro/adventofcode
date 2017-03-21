defmodule Adventofcode.Seventeen.Day02Test do
  use ExUnit.Case

  test "Given an U should move one position UP" do
    result = Adventofcode.Seventeen.Day02.move "U"
    assert result == [{-1, 0}]
  end

  test "Given an D should move one position DOWN" do
    result = Adventofcode.Seventeen.Day02.move "D"
    assert result == [{1, 0}]
  end

  test "Given an L should move one position LEFT" do
    result = Adventofcode.Seventeen.Day02.move "L"
    assert result == [{0, -1}]
  end

  test "Given an R should move one position RIGHT" do
    result = Adventofcode.Seventeen.Day02.move "R"
    assert result == [{0, 1}]
  end

  test "Given a couple of instructions should return a list of axis" do
    result = Adventofcode.Seventeen.Day02.move "ULDR"
    assert result == [{-1, 0}, {0, -1}, {1, 0}, {0, 1}]
  end

  test "Given a list of axis should return a code number" do
    result = Adventofcode.Seventeen.Day02.calculate_number [{-1, 0}, {0, -1}, {1, 0}, {0, 1}, {1, 0}]
    assert result == 8
  end

end
