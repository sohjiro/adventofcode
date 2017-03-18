defmodule Adventofcode.Seventeen.Day02Test do
  use ExUnit.Case

  test "Given an U should move one position up" do
    result = Adventofcode.Seventeen.Day02.move "U"
    assert result == [{0, -1}]
  end

end
