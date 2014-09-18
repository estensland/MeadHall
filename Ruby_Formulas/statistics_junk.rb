module StatisticsJunk

  # MEAN

  def average(array)
    array.inject(:+)/array.length
  end

  # MODE

  def mode(array)
    counter = Hash.new(0) # Create an empty hash to place numbers from array in

    array.each do |i| # Iterate over each element of the array and place in the hash.
      counter[i] += 1 # Every time a key comes up, add 1 to the value to count the occurences
    end

    mode_array = [] # Create an array that will eventually have the mode pushed in it

    counter.each do |k, v| # iterate over each value of the hash
      if v == counter.values.max # Check if the value is equal to the max key value
        mode_array << k # Push the key of the values that match the highest value into mode_array.
      end
    end

    mode_array #Return the new array
  end

  # MEDIAN

  def median(array)
    sorted = array.sort
    x = sorted.length
    (sorted[(x - 1) / 2] + sorted[x / 2]) / 2.0
  end

end