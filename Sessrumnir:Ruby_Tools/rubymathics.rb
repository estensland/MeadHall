module Rubymathics

  def repeating?(num)
    num.to_s.split('').each do |digit|
      
    end
  end

  def factorial(num)
    (1..num).to_a.inject(&:*)
  end

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

  # FIBONACCI

  def is_fibonacci?(i, prev =0, fib =1)
    return false if i.is_a?(String)
    return true  if  i == fib || i == 0
    return false if fib > i
    is_fibonacci?(i, fib, fib += prev, true)
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

  # PRIMES

  def prime?(number)
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
    low.upto(high).map do |x|
      low.upto(high).each do |y|
        z = x * y
        pallindromes << z if pallindrome?(z)
      end
    end
    pallindromes.sort
  end

  def pallindrome?(num)
    num = num.to_s
    num == num.reverse
  end
end