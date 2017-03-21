defmodule Adventofcode.Seventeen.Day02 do
  @numbers [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

  def break_number(instructions) do
    instructions
    |> String.split("\n")
    |> Enum.map(&keypad/1)
  end

  def keypad(instructions) do
    instructions
    |> instructions_to_axis
    |> calculate_number({1, 1})
  end

  def instructions_to_axis(directions) do
    directions
    |> to_charlist
    |> Enum.map(&convert/1)
  end

  def calculate_number(axis, starting_point) do
    axis
    |> Enum.reduce(starting_point, &sum_axis(&1, &2))
    |> transform_to_number
  end

  def sum_axis({x, y}, {x1, y1}), do: {x + x1, y + y1}
  defp transform_to_number({x, y}), do: @numbers |> calculate_axis(x) |> calculate_axis(y)

  defp calculate_axis(enumerable, number) when number < 0, do: enumerable |> Enum.at(0)
  defp calculate_axis(enumerable, number) when number > 2, do: enumerable |> Enum.at(2)
  defp calculate_axis(enumerable, number), do: enumerable |> Enum.at(number)

  defp convert(direction) do
    case direction do
      ?U -> {-1, 0}
      ?D -> {1, 0}
      ?L -> {0, -1}
      ?R -> {0, 1}
    end
  end

end
