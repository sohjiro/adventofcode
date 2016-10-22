defmodule Adventofcode.Day05 do
  @vowels ["a", "e", "i", "o", "u"]
  @banned ["ab", "cd", "pq", "xy"]

  def count_new_nice_strings(strings) do
    strings
    |> new_nice_string
    |> Enum.count(fn({_string, x}) -> x == :nice end)
  end

  def new_nice_string(strings) do
    strings
    |> String.split("\n")
    |> apply_new_rules([])
  end

  defp apply_new_rules([], results), do: results
  defp apply_new_rules([string | rest], results) do
    separate_by_one_letter = Regex.run(~r/([a-z])((?!\1).)\1/, string)
    repeat = Regex.run(~r/([a-z]{2,3}).*\1/, string)

    result = case {repeat, separate_by_one_letter} do
      {nil, nil} -> :naughty
      {_, nil} -> :naughty
      {nil, _} -> :naughty
      {_, _} -> :nice
    end

    apply_new_rules(rest, [{string, result} | results])
  end

  def count_nice_strings(strings) do
    strings
    |> String.split("\n")
    |> Enum.map(&nice_string?/1)
    |> Enum.count(fn(x) -> x == :nice end)
  end

  defp nice_string?(string) do
    string
    |> String.split("")
    |> apply_rules
  end

  defp apply_rules(list) do
    vowels = vowels_count(list)
    twice = twice_in_a_row(list)
    banned = banned(list)

    case {vowels, twice, banned} do
      {1, 1, 0} -> :nice
      {_v, _t, _b} -> :naughty
    end
  end

  defp vowels_count(list) do
    vowels = Enum.count(list, fn(l) -> l in @vowels end)
    case vowels > 2 do
      true -> 1
      false -> 0
    end
  end

  defp twice_in_a_row([]), do: 0
  defp twice_in_a_row([""]), do: 0
  defp twice_in_a_row([x, x | _rest]), do: 1
  defp twice_in_a_row([_x, y | rest]), do: twice_in_a_row([y | rest])

  defp banned([]), do: 0
  defp banned([""]), do: 0
  defp banned([x, y | rest]) do
    word = x <> y
    case word in @banned do
      true -> 1
      false -> banned([y | rest])
    end
  end

end
