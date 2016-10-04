defmodule Adventofcode.Day01 do

  def enter_basement(instructions) do
    instructions
    |> to_char_list
    |> follow_instructions(0, 0)
  end

  defp follow_instructions(_directions, index, -1), do: index

  defp follow_instructions([40 | directions], index, floor) do
    follow_instructions(directions, index + 1, floor + 1)
  end

  defp follow_instructions([41 | directions], index, floor) do
    follow_instructions(directions, index + 1, floor - 1)
  end

  def calculate_floor(instructions) do
    instructions
    |> to_char_list
    |> count
  end

  defp count(directions) do
    Enum.reduce(directions, 0, fn(direction, acc) ->
      case direction do
        40 -> acc + 1
        41 -> acc - 1
      end
    end)
  end

end
