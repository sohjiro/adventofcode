defmodule Adventofcode.Day05 do
  @vowels ["a", "e", "i", "o", "u"]
  @banned ["ab", "cd", "pq", "xy"]

  def new_nice_string(strings) do
    strings
    |> String.split("\n")
    |> map_tuple([])
  end

  defp map_tuple([], conversion), do: conversion
  defp map_tuple([string | rest], conversion) do
    twice = string
            |> to_char_list
            |> combine_twice_letters([])

    map_tuple(rest, [{string, twice} | conversion])
  end

  defp combine_twice_letters([_], list), do: list
  defp combine_twice_letters([a, b | rest], list), do: combine_twice_letters([b | rest], [{a, b} | list])

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
