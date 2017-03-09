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

  # test "Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away" do
  #   blocks = Adventofcode.Seventeen.Day01.calculate_blocks "R2, L3"
  #   assert blocks == 5
  # end

end
