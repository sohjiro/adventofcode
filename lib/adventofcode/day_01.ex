defmodule Adventofcode.Day01 do

  def calculate_floor(instructions) do
    instructions
    |> to_char_list
    |> count_up
    |> count_down
    |> floor
  end

  defp count_up(directions) do
    up = Enum.count(directions, fn(direction) -> direction == 40 end)
    {directions, up}
  end

  defp count_down({directions, up}) do
    down = Enum.count(directions, fn(direction) -> direction == 41 end)
    {directions, up, down}
  end

  defp floor({_directions, up, down}), do: up - down

end
