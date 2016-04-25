# JUMAN

A rudimentary Elixir wrapper for [JUMAN](http://nlp.ist.i.kyoto-u.ac.jp/EN/?JUMAN)

> JUMAN (a User-Extensible Morphological Analyzer for Japanese)

### Usage

```elixir
JUMAN.parse! "これを使いたかったですか？"
# =>
[
  %JUMAN.Token{
    base: "これ",
    kana: "これ",
    kanji: "これ",
    pos: "指示詞"
  },
  %JUMAN.Token{
    base: "を",
    kana: "を",
    kanji: "を",
    pos: "助詞"
  },
  %JUMAN.Token{
    base: "使う",
    kana: "つかい",
    kanji: "使い",
    pos: "動詞"
  },
  %JUMAN.Token{
    base: "たい",
    kana: "たかった",
    kanji: "たかった",
    pos: "接尾辞"
  },
  %JUMAN.Token{
    base: "です",
    kana: "です",
    kanji: "です",
    pos: "助動詞"
  },
  %JUMAN.Token{
    base: "か",
    kana: "か",
    kanji: "か",
    pos: "助詞"
  },
  %JUMAN.Token{
    base: "？",
    kana: "？",
    kanji: "？",
    pos: "特殊"
  }
]
```

### TODO

* find docs for complete output format
* parse the JUMAN output data more completely
* English translations for `token.pos` ("part of speech")
* investigate alternatives ChaSen and MeCab
