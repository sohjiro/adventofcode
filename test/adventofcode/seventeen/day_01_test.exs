defmodule Adventofcode.Seventeen.Day01Test do
  use ExUnit.Case

  test "Given an R2 direction should convert into a coordinate" do
    result = Adventofcode.Seventeen.Day01.convert_into_coordinate "R2"
    assert result == {2, 0}
  end

  test "Given an L2 direction should convert into a coordinate" do
    result = Adventofcode.Seventeen.Day01.convert_into_coordinate "L2"
    assert result == {0, 2}
  end

  test "Given an R2, L3 direction should convert into a coordinate" do
    result = Adventofcode.Seventeen.Day01.calculate_coordinates "R2, L3"
    assert result == {2, 3}
  end

end
