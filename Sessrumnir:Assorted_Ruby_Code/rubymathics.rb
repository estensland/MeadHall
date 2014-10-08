module Rubymathics

  def is_fibonacci?(i, prev =0, fib =1, recur=false)
    if recur # FIBONACCI NUM RECURSION
      return false if i.is_a?(String)
      return true  if  i == fib || i == 0
      return false if fib > i
      is_fibonacci?(i, fib, fib += prev, true)
    else # FIBONACCI NUM ITERATION
      if i.is_a?(String)
        return false
      elsif  i == fib || i == 0
        return true
      elsif fib > i
        return false
      else
        return is_fibonacci?(i, fib, fib += prev)
      end
    end
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