File.open('benchmarker.rb', 'w+') do |f|
  f.write <<-EOF
require 'benchmark'

# Adjust times run here
TIMES = 10000
# Adjust the number of tests to run here
quantitiy = 2

# Give each a name, though it will not run if no code is placed in it

first_name = "First"
second_name = "Second"
third_name = "Third"
fourth_name = "Fourth"
fifth_name = "Fifth"
sixth_name = "Sixth"
seventh_name = "Seventh"
eighth_name = "Eighth"
ninth_name = "Ninth"
tenth_name = "Tenth"

# Fill as many are to be used. There are ten, but only those not empty will be run.

first = Benchmark.measure {
  TIMES.times do


  end
}


############################################

if quantitiy >= 2

  second = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 3
  third = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 4
  fourth = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 5
  fifth = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 6
  sixth = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 7
  seventh = Benchmark.measure {
  TIMES.times do


  end
  }
end
############################################

if quantitiy >= 8
  eighth = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 9
  ninth = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

if quantitiy >= 10
  tenth = Benchmark.measure {
  TIMES.times do


  end
  }
end

############################################

  EOF
end
