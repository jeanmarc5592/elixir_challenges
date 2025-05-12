defmodule ElixirChallenges do
  def reverse(input) do
    input
    |> String.split("", trim: true)
    |> Enum.reverse()
    |> Enum.join()
  end

  def palindrome?(input) do
    reversed_input =
      input
      |> String.downcase()
      |> String.reverse()

    reversed_input == String.downcase(input)
  end

  def fibonacci(0), do: []
  def fibonacci(1), do: [1]
  def fibonacci(2), do: [0, 1]

  def fibonacci(count) when count > 2 do
    case count do
      _ ->
        {_, acc} =
          3..count
          |> Enum.reduce({[1, 0], [1, 0]}, fn _, {[a, b], acc} ->
            next = a + b
            {[next, a], [next | acc]}
          end)

        Enum.reverse(acc)
    end
  end

  def factorial(0), do: 1
  def factorial(1), do: 1
  # Alternative: def factorial(n) when n in [0, 1], do: 1

  def factorial(input) when input > 1 do
    # Alternative: input..1//-1
    1..input
    # Alternative: Enum.product()
    |> Enum.reduce(fn i, acc -> acc * i end)
  end

  def sum([]), do: 0

  def sum(list) when length(list) > 0 do
    Enum.reduce(list, 0, fn i, acc -> acc + i end)
  end

  def max(list) do
    Enum.reduce(list, 0, fn i, acc ->
      if i > acc, do: i, else: acc
    end)
  end

  def count(list, element) do
    Enum.reduce(list, 0, fn i, acc ->
      if i == element, do: acc + 1, else: acc
    end)
  end

  def prime?(1), do: false

  def prime?(number) when number > 1 do
    !Enum.any?(2..(number - 1), fn x -> rem(number, x) == 0 end)
  end

  def my_map(list, func) do
    list
    |> Enum.reduce([], fn x, acc -> acc ++ [func.(x)] end)
  end

  def fizzbuzz(first..last//_step) when first > last, do: []

  def fizzbuzz(range) do
    Enum.map(range, fn x ->
      cond do
        rem(x, 15) == 0 -> "FizzBuzz"
        rem(x, 3) == 0 -> "Fizz"
        rem(x, 5) == 0 -> "Buzz"
        true -> Integer.to_string(x)
      end
    end)
  end

  def uniq(list) do
    Enum.reduce(list, [], fn x, acc ->
      case Enum.member?(acc, x) do
        true -> acc
        false -> acc ++ [x]
      end
    end)

    # More efficient alternative (O(n)):
    # Enum.reduce(list, MapSet.new(), fn x, acc -> MapSet.put(acc, x) end)
    # |> MapSet.to_list()
  end

  def anagram?(left, right) do
    convert_to_frequency_map(left) == convert_to_frequency_map(right)
  end

  defp convert_to_frequency_map(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, x, 1, fn existing_value -> existing_value + 1 end)
    end)
  end

  def flatten(list) do
    Enum.reduce(list, [], fn x, acc ->
      case is_list(x) do
        true -> acc ++ flatten(x)
        false -> acc ++ [x]
      end
    end)
  end

  def rle(""), do: ""

  def rle(input) do
    {last_char, count, acc} =
      input
      |> String.graphemes()
      |> Enum.reduce({nil, 0, ""}, fn char, {last_char, count, acc} ->
        cond do
          # First run
          last_char == nil -> {char, 1, acc}
          # Still in sequence: When character hasn't changed
          last_char == char -> {last_char, count + 1, acc}
          # Default: When current character is different from the last
          true -> {char, 1, acc <> "#{last_char}#{count}"}
        end
      end)

    acc <> "#{last_char}#{count}"
  end

  def decode_rle(""), do: ""

  def decode_rle(input) do
    Regex.scan(~r/([a-zA-Z])(\d+)/, input)
    |> Enum.reduce("", fn [_rle, char, count], acc ->
      acc <> String.duplicate(char, String.to_integer(count))
    end)
  end

  def caesar(input, shift) when shift > 0 do
    # Enum.to_list(?a..?z) -> Creates a list of integers reresenting the chars (e.g. ?a -> 97)
    # Enum.map(fn x -> <<x>> end) -> Transforms each integer into a binary (UTF-8 string) using <<>>
    alphabet =
      Enum.to_list(?a..?z)
      |> Enum.map(fn x -> <<x>> end)

    input
    |> String.graphemes()
    |> Enum.map(fn char ->
      index = Enum.find_index(alphabet, fn x -> x == char end)
      shifted_index = index + shift
      # Alternative (catches longer shifts above 51):
      # shifted_index = rem(index + shift, 26)

      case shifted_index >= 26 do
        # Exceeds alphabet --> wrap around
        true -> Enum.at(alphabet, shifted_index - 26)
        # Stays within alphabet
        false -> Enum.at(alphabet, shifted_index)
      end
    end)
    |> Enum.join()
  end

  def unique_chars?(input) do
    char_list = String.graphemes(input)

    unique_chars =
      char_list
      |> Enum.reduce_while(MapSet.new(), fn x, acc ->
        case MapSet.member?(acc, x) do
          # Stops reducing and returns the current acc
          true -> {:halt, acc}
          # Continues the iteration
          false -> {:cont, MapSet.put(acc, x)}
        end
      end)
      |> MapSet.to_list()

    length(unique_chars) == length(char_list)
  end

  def chunk(list, chunk_size) do
    Enum.reduce(list, [], fn x, acc ->
      cond do
        # First iteration
        acc == [] -> [[x]]
        # Last chunk has already the desired chunk size
        length(List.last(acc, [])) == chunk_size -> acc ++ [[x]]
        # Default case: Add current value to latest chunk
        true -> List.update_at(acc, -1, fn chunk -> chunk ++ [x] end)
      end
    end)
  end

  def longest_word(""), do: nil

  def longest_word(sentence) do
    sentence
    |> String.split()
    |> Enum.max_by(fn word -> String.length(word) end)
  end

  def count_vowels(""), do: 0

  def count_vowels(input) do
    vowels = ["a", "e", "i", "o", "u"]

    input
    |> String.downcase()
    |> String.graphemes()
    |> Enum.reduce(0, fn char, acc ->
      case Enum.find(vowels, nil, fn x -> x == char end) do
        nil -> acc
        _ -> acc + 1
      end
    end)
  end

  def merge_sorted(list_one, list_two) do
    Enum.sort(list_one ++ list_two)
  end

  def group_by_length([]), do: %{}

  def group_by_length(list) do
    Enum.reduce(list, %{}, fn word, acc ->
      Map.update(acc, String.length(word), [word], fn existing_value ->
        existing_value ++ [word]
      end)
    end)
  end

  def transpose(matrix) do
    original_columns = Enum.count(List.first(matrix))

    Enum.map(0..(original_columns - 1), fn x ->
      Enum.map(matrix, fn row -> Enum.at(row, x) end)
    end)
  end

  def even?(number) do
    rem(number, 2) == 0
  end

  def dot_product([], []), do: 0

  def dot_product(list_one, list_two) do
    Enum.zip(list_one, list_two)
    |> Enum.reduce(0, fn {a, b}, acc -> acc + a * b end)
  end

  def title_case(string) do
    string
    |> String.downcase()
    |> String.split()
    |> Enum.map(fn word ->
      first_character = String.first(word)
      rest_of_word = String.slice(word, 1..-1//1)

      String.upcase(first_character) <> rest_of_word
    end)
    |> Enum.join(" ")
  end

  def rotate_left(list, steps) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {_item, index} ->
      next_index = index + steps

      case next_index > length(list) - 1 do
        true -> Enum.at(list, next_index - length(list))
        false -> Enum.at(list, next_index)
      end
    end)
  end

  def most_frequent(list) do
    {most_frequent, _} =
      list
      |> Enum.reduce(%{}, fn x, acc ->
        Map.update(acc, x, 1, fn existing_value -> existing_value + 1 end)
      end)
      |> Enum.max_by(fn {_key, value} -> value end)

    most_frequent
  end

  def range_sum(first, last) do
    min = min(first, last)
    max = max(first, last)

    Enum.reduce(min..max, 0, fn x, acc -> acc + x end)

    {min, max}
  end
end
