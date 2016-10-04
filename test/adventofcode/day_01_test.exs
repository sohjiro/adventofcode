defmodule Adventofcode.Day01Test do
  use ExUnit.Case
  doctest Adventofcode.Day01

  test "given the instruction '(())' should result in 0 floor" do
    floor = Adventofcode.Day01.calculate_floor "(())"
    assert floor == 0
  end

  test "given the instruction '()()' should result in 0 floor" do
    floor = Adventofcode.Day01.calculate_floor "()()"
    assert floor == 0
  end

  test "given the instruction '(((' should result in 3 floor" do
    floor = Adventofcode.Day01.calculate_floor "((("
    assert floor == 3
  end

  test "given the instruction '(()(()(' should result in 3 floor" do
    floor = Adventofcode.Day01.calculate_floor "(()(()("
    assert floor == 3
  end

  test "given the instruction '))(((((' should result in 3 floor" do
    floor = Adventofcode.Day01.calculate_floor "))((((("
    assert floor == 3
  end

  test "given the instruction '())' should result in -1 floor" do
    floor = Adventofcode.Day01.calculate_floor "())"
    assert floor == -1
  end

  test "given the instruction '))(' should result in -1 floor" do
    floor = Adventofcode.Day01.calculate_floor "))("
    assert floor == -1
  end

  test "given the instruction ')))' should result in -3 floor" do
    floor = Adventofcode.Day01.calculate_floor ")))"
    assert floor == -3
  end

  test "given the instruction '))(' should result in -3 floor" do
    floor = Adventofcode.Day01.calculate_floor ")())())"
    assert floor == -3
  end

  test "given the instruction ')' should result in 1 index" do
    index = Adventofcode.Day01.enter_basement ")"
    assert index == 1
  end

  test "given the instruction '()())' should result in 5 index" do
    index = Adventofcode.Day01.enter_basement "()())"
    assert index == 5
  end
end
