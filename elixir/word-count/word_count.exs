defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @punctuation ["_", "$", "!", "&", "@", "%", "^", ":", ",", ";", " "]

  @spec count(String.t()) :: map
  def count(sentence) do
  	sentence
  	|> String.split(@punctuation, trim: true)
		|> Enum.reduce(%{}, fn word, acc ->
				word = String.downcase(word)
        Map.update(acc, word, 1, &(&1 + 1))
		end)
  end
end
