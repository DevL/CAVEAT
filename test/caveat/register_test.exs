defmodule Caveat.RegisterTest do
  use ExUnit.Case
  alias Caveat.Register

  test "can interpret the register as an unsigned integer" do
    contents = << 0xFFFFFFFF :: size(32) >>
    actual = Register.unsigned_integer(contents)
    expected = 4294967295

    assert actual == expected
  end

  test "it extends unsigned values to 32 bits" do
    contents = << 0x7F :: size(8) >>
    actual = Register.unsigned_integer(contents)
    expected = 127

    assert actual == expected
  end

  test "can interpret the register as a negative signed integer" do
    contents = << 0xFFFFFFFF :: size(32) >>
    actual = Register.signed_integer(contents)
    expected = -1

    assert actual == expected
  end

  test "can interpret the register as a positive signed integer" do
    contents = << 0x7FFFFFFF :: size(32) >>
    actual = Register.signed_integer(contents)
    expected = 2147483647

    assert actual == expected
  end

  test "it sign extends positive signed values to 32 bits" do
    contents = << 0x1FF :: size(12) >>
    actual = Register.signed_integer(contents)
    expected = 511

    assert actual == expected
  end

  test "it sign extends negative signed values to 32 bits" do
    contents = << 0xF0 :: size(8) >>
    actual = Register.signed_integer(contents)
    expected = -16

    assert actual == expected
  end

  test "it can interpret the register as a single-precision float" do
    contents = <<63, 128, 0, 0>>
    actual = Register.float(contents)
    expected = 1.0

    assert actual == expected
  end
end
