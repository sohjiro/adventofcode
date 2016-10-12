defmodule Adventofcode.Day03Test do
  use ExUnit.Case
  doctest Adventofcode.Day03

  test "given a direction '>' should gave two presents to a 2 diferent houses" do
    delivers = Adventofcode.Day03.delivers("v")
    assert delivers == 2
  end

  test "given a direction '^>v<' should gave two presents to a 4 diferent houses" do
    delivers = Adventofcode.Day03.delivers("^>v<")
    assert delivers == 4
  end

  test "given a direction '^v^v^v^v^v' should gave two presents to a starting house and the east" do
    delivers = Adventofcode.Day03.delivers("^v^v^v^v^v")
    assert delivers == 2
  end

  test "given a direction '^v' and a robot santa should deliver present to 3 houses" do
    delivers = Adventofcode.Day03.delivers_with_robot("^v")
    assert delivers == 3
  end

  test "given a direction '^>v<' and a robot santa should deliver present to 3 houses" do
    delivers = Adventofcode.Day03.delivers_with_robot("^>v<")
    assert delivers == 3
  end

  test "given a direction '^v^v^v^v^v' and a robot santa should deliver present to 11 houses" do
    delivers = Adventofcode.Day03.delivers_with_robot("^v^v^v^v^v")
    assert delivers == 11
  end

end
