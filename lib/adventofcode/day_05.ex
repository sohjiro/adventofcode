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
    |> map_tuple([])
    |> apply_rules([])
  end

  defp map_tuple([], conversion), do: conversion
  defp map_tuple([string | rest], conversion) do
    charlist = to_char_list(string)
    twice = combine_twice_letters(charlist, [])
    thrice = combine_three_letters(charlist, [])

    map_tuple(rest, [{string, twice, thrice} | conversion])
  end

  defp combine_twice_letters([_], list), do: list
  defp combine_twice_letters([a, b | rest], list), do: combine_twice_letters([b | rest], [{a, b} | list])

  defp combine_three_letters([_, _], list), do: list
  defp combine_three_letters([a, b, c | rest], list), do: combine_three_letters([b, c | rest], [{a, b, c} | list])

  defp apply_rules([], results), do: results
  defp apply_rules([{string, list, thrice} | rest], results) do
    result = case {twice?(list), overlaps?(thrice)} do
      {0, _} -> :naughty
      {_, true} -> :naughty
      {_, false} -> :nice
    end
    apply_rules(rest, [{string, result} | results])
  end

  defp overlaps?(words) do
    case map_thrice(words, %{}) do
      %{overlaps: _x, repeats: _} -> true
      %{overlaps: _x} -> true
      %{repeats: _} -> false
      _ -> true
    end
  end

  defp map_thrice([], counted), do: counted
  defp map_thrice([{a, a, a} | rest], counted) do
    map_thrice(rest, Map.update(counted, :overlaps, 1, &(&1 + 1)))
  end
  defp map_thrice([{a, _b, a} | rest], counted) do
    map_thrice(rest, Map.update(counted, :repeats, 1, &(&1 + 1)))
  end
  defp map_thrice([_data | rest], counted), do: map_thrice(rest, counted)

  defp twice?(words) do
    words
    |> map_twice(%{})
    |> Enum.filter(fn({_k, v}) -> v > 1 end)
    |> length
  end

  defp map_twice([], counted), do: counted
  defp map_twice([{a, b} | rest], counted) do
    map_twice(rest, Map.update(counted, [a,b], 1, &(&1 + 1)))
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
