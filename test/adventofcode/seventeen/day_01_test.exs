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

  test "Given an R2 direction should convert into coordinates" do
    result = Adventofcode.Seventeen.Day01.calculate_coordinates "R2"
    assert result == [{2, 0}, {0, 0}]
  end

  test "Given an R2 R2 direction should convert into coordinates" do
    result = Adventofcode.Seventeen.Day01.calculate_coordinates "R2, R2"
    assert result == [{2, -2}, {2, 0}, {0, 0}]
  end

  test "Given an R2, R2, R2 direction should convert into coordinates" do
    result = Adventofcode.Seventeen.Day01.calculate_coordinates "R2, R2, R2"
    assert result == [{0, -2}, {2, -2}, {2, 0}, {0, 0}]
  end

  test "Given an R2, L3 direction should convert into coordinates" do
    result = Adventofcode.Seventeen.Day01.calculate_coordinates "R2, L3"
    assert result == [{2, 3}, {2, 0}, {0, 0}]
  end

  # test "Given an R5, L5, R5, R3 direction should convert into coordinates" do
  #   result = Adventofcode.Seventeen.Day01.calculate_coordinates "R5, L5, R5, R3"
  #   assert result == [{0, 0}, {5, 0}, {5, 5}, {5, 2}]
  # end

  # test "Given an R2, L3 direction should convert into a coordinate" do
  #   result = Adventofcode.Seventeen.Day01.calculate_final_coordinate [{0, 0}, {2, 0}, {2, 3}]
  #   assert result == {2, 3}
  # end

  # test "Given an R2, L3 direction should calculate distance blocks" do
  #   result = Adventofcode.Seventeen.Day01.calculate_blocks "R2, L3"
  #   assert result == 5
  # end

  # test "Given an R5, L5, R5, R3 direction should calculate distance blocks" do
  #   result = Adventofcode.Seventeen.Day01.calculate_blocks "R5, L5, R5, R3"
  #   assert result == 12
  # end

end
