defmodule Adventofcode.Seventeen.Day01 do

  def convert_into_coordinate(direction) do
    [direction, blocks | _rest] = String.split(direction, ~r{\d+}, include_captures: true)
    {String.to_integer(blocks), 0}
  end

end
