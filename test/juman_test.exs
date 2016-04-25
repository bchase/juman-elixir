defmodule JUMANTest do
  use ExUnit.Case
  doctest JUMAN

  test "parse a sentence into tokens" do
    [token1,token2|_] = tokens = JUMAN.parse! "行こうか"

    assert length(tokens) == 2

    assert token1.kanji == "行こう"
    assert token1.kana  == "いこう"
    assert token1.base  == "行く"
    assert token1.pos   == "動詞"

    assert token2.kanji == "か"
    assert token2.kana  == "か"
    assert token2.base  == "か"
    assert token2.pos   == "助詞"
  end
end
