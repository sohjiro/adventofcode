defmodule Adventofcode.Seventeen.Day02 do

  def move(directions) do
    directions
    |> to_charlist
    |> Enum.map(&convert/1)
  end
  def convert(direction) do
    case direction do
      ?U -> {0, -1}
      ?D -> {0, 1}
      ?L -> {-1, 0}
      ?R -> {1, 0}
    end
  end

end
