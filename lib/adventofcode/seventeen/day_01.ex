defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def calculate_blocks(instructions) do
    instructions
    |> calculate_coordinates
    |> calculate_final_coordinate
    |> taxicab
  end

  def calculate_final_coordinate(coordinates), do: coordinates |> hd

  def calculate_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&to_charlist/1)
    |> walk_from(:north, [@initial_point])
  end

  defp walk_from([], _view, acc), do: acc
  defp walk_from([[?R | blocks] | rest], view, [{x, y} | _next] = acc) do
    number_blocks = to_int(blocks)
    case view do
      :north -> walk_from(rest, :east, [{x + number_blocks, y} | acc])
      :south -> walk_from(rest, :west, [{x - number_blocks, y} | acc])
      :east -> walk_from(rest, :south, [{x, y - number_blocks} | acc])
      :west -> walk_from(rest, :north, [{x, y + number_blocks} | acc])
    end
  end
  defp walk_from([[?L | blocks] | rest], view, [{x, y} | _next] = acc) do
    number_blocks = to_int(blocks)
    case view do
      :north -> walk_from(rest, :west, [{x - number_blocks, y} | acc])
      :south -> walk_from(rest, :east, [{x + number_blocks, y} | acc])
      :east -> walk_from(rest, :north, [{x, y + number_blocks} | acc])
      :west -> walk_from(rest, :south, [{x, y - number_blocks} | acc])
    end
  end
  defp to_int(char), do: char |> to_string |> String.to_integer


  defp taxicab({q1, q2}) do
    {p1, p2} = @initial_point
    abs(p1 - q1) + abs(p2 - q2)
  end

end
