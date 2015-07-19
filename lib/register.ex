defmodule Caveat.Register do
  @positive_extension 0x00000000
  @negative_extension 0xFFFFFFFF
  @register_size      32
  @signed_value_size  @register_size - 1
  @value_correction   :math.pow(2, @signed_value_size) |> trunc

  def unsigned_integer(<< value :: size(@register_size) >>), do: value
  def unsigned_integer(<< value :: bits >>) do
    extension = @register_size - bit_size(value)
    unsigned_integer(<< @positive_extension :: size(extension), value :: bits >>)
  end

  def signed_integer(<< 1 :: size(1), value :: size(@signed_value_size) >>), do: value - @value_correction
  def signed_integer(<< 1 :: size(1), value :: bits >>) do
    extension = @register_size - bit_size(value)
    signed_integer(<< @negative_extension :: size(extension), value :: bits >>)
  end
  def signed_integer(contents), do: unsigned_integer(contents)

  def float(<< value :: float-size(@register_size) >>), do: value
end
