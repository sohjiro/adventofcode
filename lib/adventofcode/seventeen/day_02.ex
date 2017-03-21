defmodule Adventofcode.Seventeen.Day02 do
  @numbers [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

  def keypad(instructions) do
    instructions
    |> instructions_to_axis
    |> calculate_number
  end

  def instructions_to_axis(directions) do
    directions
    |> to_charlist
    |> Enum.map(&convert/1)
  end

  def calculate_number(axis) do
    axis
    |> Enum.reduce({1, 1}, &sum_axis(&1, &2))
    |> transform_to_number
  end

  defp sum_axis({x, y}, {x1, y1}), do: {x + x1, y + y1}
  defp transform_to_number({x, y}), do: @numbers |> Enum.at(x) |> Enum.at(y)

  defp convert(direction) do
    case direction do
      ?U -> {-1, 0}
      ?D -> {1, 0}
      ?L -> {0, -1}
      ?R -> {0, 1}
    end
  end

end
