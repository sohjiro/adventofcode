defmodule Adventofcode.Day05 do
  @vowels ["a", "e", "i", "o", "u"]
  @banned ["ab", "cd", "pq", "xy"]

  def nice_string?(string) do
    string_split = String.split(string, "")

    {vowels_count(string_split), twice_in_a_row(string_split), banned(string_split)}
  end

  defp vowels_count(list), do: list |> Enum.count(fn(l) -> l in @vowels end)

  defp twice_in_a_row([]), do: false
  defp twice_in_a_row([x, x | _rest]), do: true
  defp twice_in_a_row([_x, _y | rest]), do: twice_in_a_row(rest)

  defp banned(_list) do
    false
  end

end
