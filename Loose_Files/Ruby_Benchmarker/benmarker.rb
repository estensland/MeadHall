require 'benchmark'

# Fill as many are to be used. There are ten, but only those not empty will be run.

# Adjust times run here
TIMES = 10000
# Adjust the number of tests to run here
quantitiy = 5


first_name = "First"
second_name = "Second"
third_name = "Third"
fourth_name = "Fourth"
fifth_name = "Fifth"
sixth_name = "Sixth"
seventh_name = "Seventh"
eighth_name = "Eighth"
nine_name = "Ninth"
thenth_name = "Tenth"

first = Benchmark.measure {


}


############################################

unless quantitiy >= 2

  second = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 3
  third = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 4
  fourth = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 5
  fifth = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 6
  sixth = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 7
  seventh = Benchmark.measure {




  } 
end
############################################

unless quantitiy >= 8
  eighth = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 9
  ninth = Benchmark.measure {




  }
end

############################################

unless quantitiy >= 10
  tenth = Benchmark.measure {




  }
end

############################################

linguify ={1 => "first", 2 => "second", 3 => "third", 4 => "fourth", 5 => "fifth", 6 => "sixth", 7 => "seventh", 8 => "eighth", 9 => "ninth", 10 => "tenth"}

(1..quantitiy).each do |number|
  word = linguify[number]
  p eval("#{word}")

end

