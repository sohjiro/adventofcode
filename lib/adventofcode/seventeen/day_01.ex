defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def calculate_blocks(instructions) do
    instructions
    |> calculate_coordinates
    |> calculate_final_coordinate
    |> IO.inspect
    |> taxicab
  end

  def calculate_final_coordinate(coordinates), do: coordinates |> Enum.reverse |> hd

  def calculate_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&to_charlist/1)
    |> convert_into_coordinates
  end

  defp convert_into_coordinates(coordinates) do
    coordinates
    |> walk_on(:north, [@initial_point])
  end

  defp walk_on([], _view, acc), do: acc

  defp walk_on([[?R | blocks] | rest], :north, [{x, y} | _path] = acc) do
    number = to_int(blocks)
    walk_on(rest, :east, [{x + number, y} | acc])
  end
  defp walk_on([[?L | blocks] | rest], :north, [{x, y} | _path] = acc) do
    number = to_int(blocks)
    walk_on(rest, :west, [{x - number, y} | acc])
  end

  defp walk_on([[?R | blocks] | rest], :east, [{x, y} | _path] = acc) do
    number = to_int(blocks)
    walk_on(rest, :south, [{x, y - number} | acc])
  end
  defp walk_on([[?L | blocks] | rest], :east, [{x, y} | _path] = acc) do
    number = to_int(blocks)
    walk_on(rest, :north, [{x, y + number} | acc])
  end

  defp walk_on([[?R | blocks] | rest], :south, [{x, y} | _path] = acc) do
    number = to_int(blocks)
    walk_on(rest, :west, [{x - number, y} | acc])
  end
  defp walk_on([[?L | blocks] | rest], :south, [{x, y} | _path] = acc) do
    number = to_int(blocks)
    walk_on(rest, :east, [{x + number, y} | acc])
  end

  def convert_into_coordinate(direction) do
    direction
    |> to_charlist
    |> map_direction
  end

  defp map_direction([?R | blocks]), do: {to_int((blocks)), 0}
  defp map_direction([?L | blocks]), do: {0, to_int(blocks)}
  defp to_int(char), do: char |> to_string |> String.to_integer


  defp taxicab({q1, q2}) do
    {p1, p2} = @initial_point
    abs(p1 - q1) + abs(p2 - q2)
  end

end
