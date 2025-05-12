defmodule ElixirChallengesTest do
  use ExUnit.Case
  doctest ElixirChallenges

  describe "reverse/1" do
    test "reverse a normal string" do
      assert ElixirChallenges.reverse("elixir") == "rixile"
    end

    test "reverse an empty string" do
      assert ElixirChallenges.reverse("") == ""
    end
  end

  describe "palindrome?/1" do
    test "detect palindrome with mixed case" do
      assert ElixirChallenges.palindrome?("Racecar") == true
    end

    test "non-palindrome" do
      assert ElixirChallenges.palindrome?("elixir") == false
    end

    test "empty string is a palindrome" do
      assert ElixirChallenges.palindrome?("") == true
    end
  end

  describe "fibonacci/1" do
    test "generate first 5 fibonacci numbers" do
      assert ElixirChallenges.fibonacci(5) == [0, 1, 1, 2, 3]
    end

    test "zero elements" do
      assert ElixirChallenges.fibonacci(0) == []
    end
  end

  describe "factorial/1" do
    test "factorial of 5" do
      assert ElixirChallenges.factorial(5) == 120
    end

    test "factorial of 0" do
      assert ElixirChallenges.factorial(0) == 1
    end
  end

  describe "sum/1" do
    test "sum of list" do
      assert ElixirChallenges.sum([1, 2, 3]) == 6
    end

    test "sum empty list" do
      assert ElixirChallenges.sum([]) == 0
    end
  end

  describe "max/1" do
    test "maximum of list" do
      assert ElixirChallenges.max([3, 7, 2]) == 7
    end

    test "single element list" do
      assert ElixirChallenges.max([5]) == 5
    end
  end

  describe "count/2" do
    test "count occurrences of 1" do
      assert ElixirChallenges.count([1, 2, 1, 3], 1) == 2
    end

    test "value not found" do
      assert ElixirChallenges.count([1, 2, 3], 4) == 0
    end
  end

  describe "prime?/1" do
    test "prime number" do
      assert ElixirChallenges.prime?(7) == true
    end

    test "non-prime number" do
      assert ElixirChallenges.prime?(8) == false
    end

    test "edge case: 1 is not prime" do
      assert ElixirChallenges.prime?(1) == false
    end
  end

  describe "my_map/2" do
    test "map double function" do
      assert ElixirChallenges.my_map([1, 2], fn x -> x * 2 end) == [2, 4]
    end

    test "map empty list" do
      assert ElixirChallenges.my_map([], fn x -> x * 2 end) == []
    end
  end

  describe "fizzbuzz/1" do
    test "fizzbuzz from 1 to 15" do
      assert ElixirChallenges.fizzbuzz(1..15) == [
               "1",
               "2",
               "Fizz",
               "4",
               "Buzz",
               "Fizz",
               "7",
               "8",
               "Fizz",
               "Buzz",
               "11",
               "Fizz",
               "13",
               "14",
               "FizzBuzz"
             ]
    end

    test "fizzbuzz empty range" do
      assert ElixirChallenges.fizzbuzz(1..0//-1) == []
    end
  end

  describe "uniq/1" do
    test "removes duplicates" do
      assert ElixirChallenges.uniq([1, 2, 2, 3, 1]) == [1, 2, 3]
    end

    test "empty list" do
      assert ElixirChallenges.uniq([]) == []
    end
  end

  describe "anagram?/2" do
    test "anagram match" do
      assert ElixirChallenges.anagram?("listen", "silent") == true
    end

    test "not an anagram" do
      assert ElixirChallenges.anagram?("elixir", "rails") == false
    end

    test "case insensitive" do
      assert ElixirChallenges.anagram?("Race", "care") == true
    end
  end

  describe "flatten/1" do
    test "flatten nested list" do
      assert ElixirChallenges.flatten([1, [2, [3]], 4]) == [1, 2, 3, 4]
    end

    test "already flat list" do
      assert ElixirChallenges.flatten([1, 2, 3]) == [1, 2, 3]
    end
  end

  describe "rle/1 and decode_rle/1" do
    test "basic encoding" do
      assert ElixirChallenges.rle("aaabbc") == "a3b2c1"
    end

    test "basic decoding" do
      assert ElixirChallenges.decode_rle("a3b2c1") == "aaabbc"
    end

    test "empty string" do
      assert ElixirChallenges.rle("") == ""
      assert ElixirChallenges.decode_rle("") == ""
    end

    test "single characters" do
      assert ElixirChallenges.rle("abc") == "a1b1c1"
      assert ElixirChallenges.decode_rle("a1b1c1") == "abc"
    end

    test "long runs" do
      assert ElixirChallenges.rle("aaaaa") == "a5"
      assert ElixirChallenges.decode_rle("a5") == "aaaaa"
    end
  end

  describe "caesar/2" do
    test "encode with shift 3" do
      assert ElixirChallenges.caesar("abc", 3) == "def"
    end

    test "wrap around alphabet" do
      assert ElixirChallenges.caesar("xyz", 3) == "abc"
    end
  end

  describe "unique_chars?/1" do
    test "all unique" do
      assert ElixirChallenges.unique_chars?("thief") == true
    end

    test "repeated characters" do
      assert ElixirChallenges.unique_chars?("banana") == false
    end
  end

  describe "chunk/2" do
    test "chunk list into 2s" do
      assert ElixirChallenges.chunk([1, 2, 3, 4], 2) == [[1, 2], [3, 4]]
    end

    test "chunk with remainder" do
      assert ElixirChallenges.chunk([1, 2, 3], 2) == [[1, 2], [3]]
    end

    test "empty input list" do
      assert ElixirChallenges.chunk([], 5) == []
    end
  end

  describe "longest_word/1" do
    test "find longest word" do
      assert ElixirChallenges.longest_word("The quick brown fox") == "quick"
    end

    test "empty string" do
      assert ElixirChallenges.longest_word("") == nil
    end
  end

  describe "count_vowels/1" do
    test "counts vowels in lowercase string" do
      assert ElixirChallenges.count_vowels("elixir") == 3
    end

    test "counts vowels in mixed case string" do
      assert ElixirChallenges.count_vowels("AEIOUxyz") == 5
    end

    test "no vowels" do
      assert ElixirChallenges.count_vowels("bcdfg") == 0
    end

    test "empty string" do
      assert ElixirChallenges.count_vowels("") == 0
    end
  end

  describe "merge_sorted/2" do
    test "merge two sorted lists" do
      assert ElixirChallenges.merge_sorted([1, 3, 5], [2, 4, 6]) == [1, 2, 3, 4, 5, 6]
    end

    test "merge with empty list" do
      assert ElixirChallenges.merge_sorted([], [1, 2]) == [1, 2]
      assert ElixirChallenges.merge_sorted([3, 4], []) == [3, 4]
    end

    test "merge both empty lists" do
      assert ElixirChallenges.merge_sorted([], []) == []
    end
  end

  describe "group_by_length/1" do
    test "groups words by their lengths" do
      input = ["hi", "there", "to", "go"]
      result = ElixirChallenges.group_by_length(input)
      assert result == %{2 => ["hi", "to", "go"], 5 => ["there"]}
    end

    test "handles empty list" do
      assert ElixirChallenges.group_by_length([]) == %{}
    end

    test "handles words with same length" do
      input = ["a", "b", "c"]
      assert ElixirChallenges.group_by_length(input) == %{1 => ["a", "b", "c"]}
    end
  end

  describe "transpose/1" do
    test "transpose 2x2 matrix" do
      assert ElixirChallenges.transpose([[1, 2], [3, 4]]) == [[1, 3], [2, 4]]
    end

    test "transpose 2x3 matrix" do
      assert ElixirChallenges.transpose([[1, 2, 3], [4, 5, 6]]) == [[1, 4], [2, 5], [3, 6]]
    end

    test "transpose 1xN and Nx1" do
      assert ElixirChallenges.transpose([[1, 2, 3]]) == [[1], [2], [3]]
      assert ElixirChallenges.transpose([[1], [2], [3]]) == [[1, 2, 3]]
    end
  end

  describe "even?/1" do
    test "even numbers" do
      assert ElixirChallenges.even?(4) == true
      assert ElixirChallenges.even?(0) == true
    end

    test "odd numbers" do
      assert ElixirChallenges.even?(7) == false
      assert ElixirChallenges.even?(-3) == false
    end
  end

  describe "dot_product/2" do
    test "dot product of two 3-element lists" do
      assert ElixirChallenges.dot_product([1, 2, 3], [4, 5, 6]) == 32
    end

    test "dot product with zeros" do
      assert ElixirChallenges.dot_product([0, 0], [1, 2]) == 0
    end

    test "empty lists" do
      assert ElixirChallenges.dot_product([], []) == 0
    end
  end

  describe "title_case/1" do
    test "basic title case" do
      assert ElixirChallenges.title_case("hello world") == "Hello World"
    end

    test "already capitalized" do
      assert ElixirChallenges.title_case("Elixir Is Fun") == "Elixir Is Fun"
    end

    test "mixed case and extra spaces" do
      assert ElixirChallenges.title_case("eLiXiR  is   AwEsoMe") == "Elixir Is Awesome"
    end

    test "empty string" do
      assert ElixirChallenges.title_case("") == ""
    end
  end

  describe "rotate_left/2" do
    test "rotate by 2 positions" do
      assert ElixirChallenges.rotate_left([1, 2, 3, 4, 5], 2) == [3, 4, 5, 1, 2]
    end

    test "rotate by length" do
      assert ElixirChallenges.rotate_left([1, 2, 3], 3) == [1, 2, 3]
    end

    test "rotate by more than length (wrap around)" do
      assert ElixirChallenges.rotate_left([1, 2], 5) == [2, 1]
    end

    test "empty list" do
      assert ElixirChallenges.rotate_left([], 3) == []
    end

    test "rotate by 0" do
      assert ElixirChallenges.rotate_left([1, 2, 3], 0) == [1, 2, 3]
    end
  end

  describe "most_frequent/1" do
    test "returns most frequent number" do
      assert ElixirChallenges.most_frequent([1, 2, 2, 3]) == 2
    end

    test "returns most frequent string" do
      assert ElixirChallenges.most_frequent(["a", "b", "a", "c", "b", "a"]) == "a"
    end

    test "tie between elements" do
      result = ElixirChallenges.most_frequent([:x, :y, :x, :y])
      assert result in [:x, :y]
    end

    test "empty list returns nil" do
      assert ElixirChallenges.most_frequent([]) == nil
    end
  end

  describe "range_sum/2" do
    test "ascending range" do
      assert ElixirChallenges.range_sum(1, 5) == 15
    end

    test "descending range" do
      assert ElixirChallenges.range_sum(5, 1) == 15
    end

    test "single value range" do
      assert ElixirChallenges.range_sum(3, 3) == 3
    end
  end
end
