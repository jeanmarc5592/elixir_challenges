# Elixir Challenges

A collection of beginner-to-intermediate level Elixir functions to practice core language concepts, functional programming, and standard library usage. Each function is defined in `ElixirChallenges` and tested using ExUnit.

## Challenges

### `reverse/1`

Create a function `reverse/1` that takes a string and returns its reversed version.

**Examples:**
- `reverse("elixir") #=> "rixile"`
- `reverse("") #=> ""`

---

### `palindrome?/1`

Check whether a given string is a palindrome (case-insensitive).

**Examples:**
- `palindrome?("Racecar") #=> true`
- `palindrome?("elixir") #=> false`
- `palindrome?("") #=> true`

---

### `fibonacci/1`

Generate the first `n` Fibonacci numbers.

**Examples:**
- `fibonacci(5) #=> [0, 1, 1, 2, 3]`
- `fibonacci(0) #=> []`

---

### `factorial/1`

Calculate the factorial of a non-negative integer.

**Examples:**
- `factorial(5) #=> 120`
- `factorial(0) #=> 1`

---

### `sum/1`

Return the sum of all elements in a list.

**Examples:**
- `sum([1, 2, 3]) #=> 6`
- `sum([]) #=> 0`

---

### `max/1`

Return the maximum value from a list of numbers.

**Examples:**
- `max([3, 7, 2]) #=> 7`
- `max([5]) #=> 5`

---

### `count/2`

Count how many times a given value appears in a list.

**Examples:**
- `count([1, 2, 1, 3], 1) #=> 2`
- `count([1, 2, 3], 4) #=> 0`

---

### `prime?/1`

Check whether a number is prime.

**Examples:**
- `prime?(7) #=> true`
- `prime?(8) #=> false`
- `prime?(1) #=> false`

---

### `my_map/2`

Reimplement `Enum.map/2`.

**Examples:**
- `my_map([1, 2], fn x -> x * 2 end) #=> [2, 4]`
- `my_map([], fn x -> x * 2 end) #=> []`

---

### `fizzbuzz/1`

Implement FizzBuzz over a given range.

**Example:**
- `fizzbuzz(1..15) #=> ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]`

---

### `uniq/1`

Remove duplicates from a list.

**Examples:**
- `uniq([1, 2, 2, 3, 1]) #=> [1, 2, 3]`
- `uniq([]) #=> []`

---

### `anagram?/2`

Check if two strings are anagrams (case-insensitive).

**Examples:**
- `anagram?("listen", "silent") #=> true`
- `anagram?("elixir", "rails") #=> false`
- `anagram?("Race", "care") #=> true`

---

### `flatten/1`

Flatten a nested list.

**Examples:**
- `flatten([1, [2, [3]], 4]) #=> [1, 2, 3, 4]`
- `flatten([1, 2, 3]) #=> [1, 2, 3]`

---

### `rle/1` and `decode_rle/1`

Implement run-length encoding and decoding.

**Examples:**
- `rle("aaabbc") #=> "a3b2c1"`
- `decode_rle("a3b2c1") #=> "aaabbc"`
- `rle("") #=> ""`, `decode_rle("") #=> ""`
- `rle("abc") #=> "a1b1c1"`, `decode_rle("a1b1c1") #=> "abc"`
- `rle("aaaaa") #=> "a5"`, `decode_rle("a5") #=> "aaaaa"`

---

### `caesar/2`

Implement a Caesar cipher with a given character shift.

**Examples:**
- `caesar("abc", 3) #=> "def"`
- `caesar("xyz", 3) #=> "abc"`

---

### `unique_chars?/1`

Check if a string contains only unique characters.

**Examples:**
- `unique_chars?("thief") #=> true`
- `unique_chars?("banana") #=> false`

---

### `chunk/2`

Split a list into chunks of a given size.

**Examples:**
- `chunk([1, 2, 3, 4], 2) #=> [[1, 2], [3, 4]]`
- `chunk([1, 2, 3], 2) #=> [[1, 2], [3]]`
- `chunk([], 5) #=> []`

---

### `longest_word/1`

Find the longest word in a sentence.

**Examples:**
- `longest_word("The quick brown fox") #=> "quick"`
- `longest_word("") #=> nil`

---

### `count_vowels/1`

Count the number of vowels (`a, e, i, o, u`) in a given string. Case-insensitive.

**Examples:**
- `count_vowels("elixir") #=> 3`
- `count_vowels("AEIOUxyz") #=> 5`
- `count_vowels("bcdfg") #=> 0`
- `count_vowels("") #=> 0`

---

### `merge_sorted/2`

Merge two sorted lists into a single sorted list without using `Enum.sort/1`.

**Examples:**
- `merge_sorted([1, 3, 5], [2, 4, 6]) #=> [1, 2, 3, 4, 5, 6]`
- `merge_sorted([], [1, 2]) #=> [1, 2]`
- `merge_sorted([3, 4], []) #=> [3, 4]`
- `merge_sorted([], []) #=> []`

---

### `group_by_length/1`

Group words by their length into a map. The keys are lengths and values are lists of words.

**Examples:**
- `group_by_length(["hi", "there", "to", "go"]) #=> %{2 => ["hi", "to", "go"], 5 => ["there"]}`
- `group_by_length(["a", "b", "c"]) #=> %{1 => ["a", "b", "c"]}`
- `group_by_length([]) #=> %{}`

---

### `transpose/1`

Transpose a list of lists (matrix). Converts rows to columns and vice versa.

**Examples:**
- `transpose([[1, 2], [3, 4]]) #=> [[1, 3], [2, 4]]`
- `transpose([[1, 2, 3], [4, 5, 6]]) #=> [[1, 4], [2, 5], [3, 6]]`
- `transpose([[1, 2, 3]]) #=> [[1], [2], [3]]`
- `transpose([[1], [2], [3]]) #=> [[1, 2, 3]]`

---

### `even?/1`

Return `true` if an integer is even, otherwise `false`.

**Examples:**
- `even?(4) #=> true`
- `even?(0) #=> true`
- `even?(7) #=> false`
- `even?(-3) #=> false`

---

### `dot_product/2`

Compute the dot product of two equal-length lists of numbers.

**Examples:**
- `dot_product([1, 2, 3], [4, 5, 6]) #=> 32`
- `dot_product([0, 0], [1, 2]) #=> 0`
- `dot_product([], []) #=> 0`

---

### `title_case/1`

Capitalize the first letter of each word in a string.

**Examples:**
- `title_case("hello world") #=> "Hello World"`
- `title_case("eLiXiR  is   AwEsoMe") #=> "Elixir Is Awesome"`
- `title_case("") #=> ""`

---

### `rotate_left/2`

Rotate a list to the left by `n` positions. Wraps around if `n` exceeds the list length.

**Examples:**
- `rotate_left([1, 2, 3, 4, 5], 2) #=> [3, 4, 5, 1, 2]`
- `rotate_left([1, 2], 5) #=> [2, 1]`
- `rotate_left([], 3) #=> []`
- `rotate_left([1, 2, 3], 0) #=> [1, 2, 3]`

---

## Running Tests

To run all tests:

```bash
mix test