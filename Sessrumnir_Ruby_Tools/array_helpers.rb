module ArrayHelpers

  def n_multiples(array, num = 2, operan = :>=)
    multiples_finder(array, num, :==)
  end

  def at_least_n_multiples(array, num = 2)
    multiples_finder(array, num, :>=)
  end

  def multiples_finder(array, num = 2, operan = :>=)
    array.group_by{ |e| e }.select { |k, v| v.size.send(operan.to_sym, num) }.map(&:first)
  end

end
