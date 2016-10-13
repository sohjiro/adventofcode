defmodule Adventofcode.Day05 do
  @vowels 'aeiou'

  def nice_string?(string) do
    string
    |> to_char_list
    |> vowels_count
  end

  defp vowels_count(list), do: list |> Enum.count(fn(l) -> l in @vowels end)

end
