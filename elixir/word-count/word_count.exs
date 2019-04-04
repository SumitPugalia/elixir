defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @punctuation ["_", "$", "!", "&", "@", "%", "^", ":", ",", ";"]

  @spec count(String.t()) :: map
  def count(sentence) do
  	sentence
  	|> String.replace(@punctuation, " ")
  	|> String.split(" ")
		|> Enum.reduce(%{}, fn word, acc ->
				word = String.downcase(word)
				case Map.get(acc, word) do
					nil ->
						Map.put(acc, word, 1)
					count ->
						Map.put(acc, word, count + 1)
				end
		end)
		|> Map.delete("")
  end
end
