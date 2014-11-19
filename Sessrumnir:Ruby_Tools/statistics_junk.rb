
module StatisticsJunk
  # Monkey patch this onto class Array

  # MEAN
  def mean
    self.inject(:+)/self.length
  end

  def average
    self.mean
  end

  # MODE
  def mode
    counter = Hash.new(0) # Create an empty hash to place numbers from array in

    self.each do |i| # Iterate over each element of the array and place in the hash.
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
  def median
    sorted = self.sort
    x = sorted.length
    (sorted[(x - 1) / 2] + sorted[x / 2]) / 2.0
  end

  # STANDARD DEVIATION
  def standard_deviation
    u = self.mean #cache the mean
    result = self.inject(0){|sum, num| sum + ((num - u) ** 2)} # sum of the squared variance for each item
    Math.sqrt((result.to_f / self.length)) # Get the the square root of the mean of the sumed squared variance
  end

end