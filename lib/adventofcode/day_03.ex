defmodule Adventofcode.Day03 do

  def delivers(params) do
    params
    |> to_char_list
    |> add_starting_point
    |> convert_to_coordinates
    |> follow_directions([])
    |> Enum.uniq
    |> length
  end

  defp add_starting_point(houses), do: [?. | houses]

  defp follow_directions([], visited), do: visited
  defp follow_directions([point | rest], visited) do
    follow_directions(rest, deliver_gift_to(point, visited))
  end

  defp convert_to_coordinates(directions) do
    for direction <- directions do
      case direction do
        ?. -> {0, 0}
        ?^ -> {0, 1}
        ?v -> {0, -1}
        ?> -> {-1, 0}
        ?< -> {1, 0}
      end
    end
  end

  defp deliver_gift_to(_starting, []), do: [{0, 0}]
  defp deliver_gift_to({x, y}, [{x1, y1} | _rest] = visited), do: [{x + x1, y + y1} | visited]

end
