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

## Running Tests

To run all tests:

```bash
mix test