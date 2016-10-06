defmodule Adventofcode.Day02 do

  def calculate_ribbon(params) do
    params
    |> String.split("\n")
    |> Stream.map(&split_and_convert/1)
    |> Stream.map(&total_ribbon/1)
    |> Enum.sum
  end

  defp total_ribbon(dimentions) do
    dimentions
    |> calculate_ribbon_bow
    |> calculate_ribbon_wrap
  end

  defp calculate_ribbon_bow([a, b, c] = dimentions), do: {Enum.sort(dimentions), a * b * c}
  defp calculate_ribbon_wrap({[a, b, _c], perimeter}), do: 2 * (a + b) + perimeter

  def calculate_paper(params) do
    params
    |> String.split("\n")
    |> Stream.map(&split_and_convert/1)
    |> Stream.map(&total_paper/1)
    |> Enum.sum
  end

  defp split_and_convert(data) do
    data
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
  end

  defp total_paper(dimentions) do
    dimentions
    |> calculate_area
    |> calculate_extra_paper
  end

  defp calculate_area([l, w, h] = dimentions), do: {Enum.sort(dimentions), 2*l*w + 2*w*h + 2*h*l}
  defp calculate_extra_paper({[a, b, _c], area}), do: a * b + area

end
