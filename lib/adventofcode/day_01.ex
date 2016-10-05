defmodule Adventofcode.Day01 do

  def enter_basement(instructions) do
    instructions
    |> to_char_list
    |> follow_instructions(0, 0, :basement)
  end

  defp follow_instructions(_directions, index, -1, :basement), do: index
  defp follow_instructions([], _index, floor, _atom), do: floor

  defp follow_instructions([?( | directions], index, floor, atom) do
    follow_instructions(directions, index + 1, floor + 1, atom)
  end

  defp follow_instructions([?) | directions], index, floor, atom) do
    follow_instructions(directions, index + 1, floor - 1, atom)
  end

  def calculate_floor(instructions) do
    instructions
    |> to_char_list
    |> follow_instructions(0, 0, :total)
  end

end
