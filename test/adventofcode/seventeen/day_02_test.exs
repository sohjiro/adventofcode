defmodule Adventofcode.Seventeen.Day02Test do
  use ExUnit.Case

  test "Given an U should move one position up" do
    result = Adventofcode.Seventeen.Day02.move "U"
    assert result == [{0, -1}]
  end

  test "Given a point and an UP direction should return the above point" do
    result = Adventofcode.Seventeen.Day02.move_from {1, 1}, ?U
    assert result == {1, 0}
  end

end
