defmodule Adventofcode.Day02Test do
  use ExUnit.Case
  doctest Adventofcode.Day02

  test "given a present with dimensions '2x3x4' should require 58 square feet of paper" do
    require_paper = Adventofcode.Day02.calculate_paper("2x3x4")

    assert require_paper == 58
  end

end
