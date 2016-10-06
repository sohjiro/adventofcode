defmodule Adventofcode.Day02Test do
  use ExUnit.Case
  doctest Adventofcode.Day02

  test "given a present with dimensions '2x3x4' should require 58 square feet of paper" do
    require_paper = Adventofcode.Day02.calculate_paper("2x3x4")
    assert require_paper == 58
  end

  test "given a present with dimensions '1x1x10' should require 43 square feet of paper" do
    require_paper = Adventofcode.Day02.calculate_paper("1x1x10")
    assert require_paper == 43
  end

  test "given presents with dimentions \"2x3x4\n1x1x10\" should order 101 feet of paper" do
    require_paper = Adventofcode.Day02.calculate_paper("2x3x4\n1x1x10")
    assert require_paper == 101
  end

  test "given presents with dimentions \"2x3x4\" should require 34 of ribbon" do
    require_paper = Adventofcode.Day02.calculate_ribbon("2x3x4")
    assert require_paper == 34
  end

  test "given presents with dimentions \"1x1x10\" should require 14 of ribbon" do
    require_paper = Adventofcode.Day02.calculate_ribbon("1x1x10")
    assert require_paper == 14
  end

  test "given presents with dimentions \"2x3x4\n1x1x10\" should require 48 of ribbon" do
    require_paper = Adventofcode.Day02.calculate_ribbon("2x3x4\n1x1x10")
    assert require_paper == 48
  end

end
