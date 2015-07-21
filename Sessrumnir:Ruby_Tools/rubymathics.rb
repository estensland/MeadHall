module Rubymathics

  # UTILITY METHODS

  def number_split(num)
    num.to_s.split(//).map(&:to_i)
  end

  # REPEATING DECIMALS

  def repeating_decimal?(num)
    count = 0
    denominator = 1
    res = 0.1
    remainders = []

    loop do
      denominator = res * 10
      res = denominator % num
      return count - remainders.index(res) if remainders.include?(res)
      remainders << res
      count += 1
      return false if count == num || res == 0
    end

    true
  end

  def repeating_cycle_length(num)
    count = 0
    denominator = 1
    res = 0.1
    remainders = []

    loop do
      denominator = res * 10
      res = denominator % num
      return count - remainders.index(res) if remainders.include?(res)
      remainders << res
      count += 1
      return 0 if count == num || res == 0
    end

    count - remainders.index(res)
  end

  # FACTORIAL

  def factorial(num)
    (1..num).to_a.inject(&:*)
  end

  # COLLATZ SEQUENCE

  def collatz_sequence(num)
    sequence = [num]
    until num == 1
      if num.even?
        num = num/2
      else
        num = (3 * num) + 1
      end
      sequence << num
    end
    sequence
  end

  # RIGHT TRIANGLE

  def right_triangle?(a,b,c)
    (a**2 + b**2) == c ** 2
  end

  def right_get_c(a,b)
    (a**2 + b**2) ** 0.5
  end

  # PANDIGITAL

  def pandigital?(number)
    splitted = number_split(number)
    split_uniq = splitted.uniq.reject(&:zero?)
    return false if split_uniq.length != splitted.length
    split_uniq.inject(:+) == 45
  end

  # FIBONACCI

  def is_fibonacci?(i, prev = 0, fib = 1)
    return false if i.is_a?(String)
    return true  if  i == fib || i == 0
    return false if fib > i
    is_fibonacci?(i, fib, fib += prev)
  end

  def fibonacci_at(opts = {})
    raise '[:number_digits] is undefined' if opts[:number_digits].nil?

    prev = 0
    fib = 1
    nth_term = 1

    until fib.to_s.length >= opts[:number_digits]
      store = fib
      fib += prev
      prev = store
      nth_term +=1
    end

    return nth_term if opts[:display] == 'nth_term'

    fib
  end

  def fibonacci_below(number)
    prev = 0
    fib = 1
    nums = []
  
    until fib >= number
      store = fib
      fib += prev
      prev = store
      nums << fib
    end

    nums
  end

  # PRIMES

  def all_permutations_prime?(num)
    digits = number_split(num)

    digits.length.times do
      digits.unshift(digits.pop)

      permutation = digits.inject{|sum, i| sum * 10 + i}
      return false unless prime?(permutation)
    end
    true
  end

  def prime?(number)
    return false if number == 1
    2.upto(number**0.5) do |i|
      return false if number%i == 0
    end
    true
  end

  def find_biggest_prime_factor(number)
    prime_factor = 2

    until number == 1

      if number % prime_factor == 0
        number /= prime_factor
      else
        prime_factor += 1
      end

    end
    prime_factor
  end


  # PALLINDROME

  def pallindrome_finder(low, high)
    pallindromes = []
    low.upto(high).map do |num|
      pallindromes << num if pallindrome?(num)
    end
    pallindromes
  end

  def pallindrome?(num, base = 2)
    num = base ? num.to_s : num.to_s(base)
    num == num.reverse
  end
  
  # TRIANGLE NUMBER
  
  def nth_triangle_number(num)
    (num * (num + 1 )) /2
  end
  
  # PENTAGONAL NUMBER
  
  def nth_pentagonal_number(num)
    (num * (3 * (num − 1))) / 2	
  end
  
  # HEXAGONAL NUMBER
  
  def nth_hexagonal_number(num)
    num * ((2 * num) −1)
  end
end
