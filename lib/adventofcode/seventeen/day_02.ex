defmodule Adventofcode.Seventeen.Day02 do
  @numbers [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  @initial_point {1, 1}

  def keypad(instructions) do
    instructions
    |> String.split("\n")
    |> Enum.map(&Task.async(Adventofcode.Seventeen.Day02, :instructions_to_axis, [&1]))
    |> Enum.map(&Task.await/1)
    |> calculate_axes
    |> Enum.map(&convert_to_digit/1)
  end

  def instructions_to_axis(directions) do
    directions
    |> to_charlist
    |> Enum.map(&convert/1)
  end

  def calculate_axes(axes, acc \\ [@initial_point])
  def calculate_axes([], acc), do: acc |> Enum.reverse |> tl
  def calculate_axes([axis | rest], [last_point | _next] = acc) do
    result = calculate_axis(axis, last_point)
    calculate_axes(rest, [result | acc])
  end

  def calculate_axis(axis, starting_point) do
    axis |> Enum.reduce(starting_point, &sum_axis(&1, &2))
  end

  def sum_axis({x, y}, {x1, y1}), do: {valid(x + x1), valid(y + y1)}

  defp valid(number) when number < 0, do: 0
  defp valid(number) when number > 2, do: 2
  defp valid(number), do: number

  def convert_to_digit({x, y}), do: @numbers |> Enum.at(x) |> Enum.at(y)

  defp convert(direction) do
    case direction do
      ?U -> {-1, 0}
      ?D -> {1, 0}
      ?L -> {0, -1}
      ?R -> {0, 1}
    end
  end

end
