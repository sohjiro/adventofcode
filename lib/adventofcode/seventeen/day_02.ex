defmodule Adventofcode.Seventeen.Day02 do

  def move(directions) do
    directions
    |> to_charlist
    |> Enum.map(&convert/1)
  end

  defp convert(direction) do
    case direction do
      ?U -> {-1, 0}
      ?D -> {1, 0}
      ?L -> {0, -1}
      ?R -> {0, 1}
    end
  end

end
