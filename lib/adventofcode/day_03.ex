defmodule Adventofcode.Day03 do

  def delivers_with_robot(params) do
    directions = params
    |> to_char_list
    |> Enum.with_index
    |> split_directions([])

    santa = directions
    |> calculate_for(:santa)
    |> Enum.uniq

    IO.inspect santa

    robot = directions
    |> calculate_for(:robot)
    |> Enum.uniq

    santa ++ robot
    |> Enum.uniq
    |> length
  end

  defp calculate_for(directions, atom) do
    IO.puts "atom : #{inspect atom}"
    directions
    |> Keyword.get_values(atom)
    |> Enum.reverse
    |> add_starting_point
    |> convert_to_coordinates
    |> follow_directions([])
  end

  def split_directions([], data), do: data
  def split_directions([{element, index} | rest], data) when rem(index, 2) == 0 do
    split_directions(rest, [{:santa, element} | data])
  end
  def split_directions([{element, _index} | rest], data) do
    split_directions(rest, [{:robot, element} | data])
  end

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
        ?> -> {1, 0}
        ?< -> {-1, 0}
      end
    end
  end

  defp deliver_gift_to(_starting, []), do: [{0, 0}]
  defp deliver_gift_to({x, y}, [{x1, y1} | _rest] = visited), do: [{x + x1, y + y1} | visited]

end
