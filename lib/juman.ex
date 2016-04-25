defmodule JUMAN do
  defmodule Token do
    defstruct [:kanji, :kana, :base, :pos]
  end

  def parse!(text) do
    process_output exec(text)
  end


  defp exec(text) do
    filepath = "/tmp/#{System.unique_integer}"
    File.write! filepath, text
    output = "juman <#{filepath} -b -e2"
              |> to_char_list
              |> :os.cmd
              |> to_string
    File.rm filepath
    output
  end

  defp process_output(output),
    do: process_lines String.split(output, "\n")

  defp process_lines(["EOS"|_], tokens), do: tokens
  defp process_lines([line|lines], tokens \\ []) do
    process_lines lines, tokens ++ [parse_line(line)]
  end

  defp parse_line(str) do
    [kanji, kana, base, pos | _info] = String.split(str, ~r{\s+})
    %Token{
      kanji: kanji,
      kana:  kana,
      base:  base,
      pos:   pos,
    }
  end
end
