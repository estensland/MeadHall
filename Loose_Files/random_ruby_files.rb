# PASSWORD VALIDATION REGEX


def check_password input
  
  return "Password too short, must be 6 or more" unless input.length >= 6 

  return "Password too long, no more than 20 characters" unless input.length <= 20

  return "Need at least one capital letter" unless input =~ /[A-Z]/

  special_characters = "!, @, #, $, %, &, *, +, :, ?"
  array = [("A".."Z").to_a + ("a".."z").to_a + ([" "]) + ("1".."9").to_a + special_characters.split(", ")]

  unless input =~ /\d/ || input.split('').any? { |i|  special_characters.split(", ").include?(i) }
    return "Need at least one number or one special character (#{special_characters})"
  end

  unless input.split('').all? { |i|  array.flatten.include?(i) }
    return "Invalid character, must be alphanumeric of an allowed special character (#{special_characters})"
  end

    return "Valid Password"  # If it has made it this far without being returned, it is true

end


p "false on short" if check_password("bo") != "Password too short, must be 6 or more"
p "false on long" if check_password("this is far too long for this exercise, please say it is") != "Password too long, no more than 20 characters"
p "false on capital" if check_password("1234567") != "Need at least one capital letter"
p "false on capital" if check_password("12b45a7") != "Need at least one capital letter"
p "false on number/special" if check_password("Aaaaaaaaaaa") != "Need at least one number or one special character (!, @, #, $, %, &, *, +, :, ?)"
p "not true on number" if check_password("Aaaaa2aaaaa") != "Valid Password"
p "not true on ?" if check_password("Aaaaa?aaaaa") != "Valid Password"
p "not true on #" if check_password("Aaaaa#aaaaa") != "Valid Password"
p "not true on legit password 1" if check_password("Thisispassword56") != "Valid Password"
p "not true on legit password 2" if check_password("Imade p@ssword") != "Valid Password"
p "gives false true for ^" if check_password("Imade p@sswo^&rd") == "Valid Password"

# VALID NESTING OF ()[]{}

def valid_string? input

  unless input.is_a? String     # Argument error if not a string
      raise ArgumentError.new("Input is not even a string to begin with!") 
  end

  parens_tally = 0      # This and the next two keep track of open vs. unopen of each type
  bracket_tally = 0
  curls_tally = 0
  open = []             # Keeps track of the last opened brackets
  counter=0
  while counter < input.length                  # This goes character by character to see if the parens/brackets/curls are properly nested
    if input[counter] == "("
      parens_tally +=1
      open << "parens"
    elsif input[counter] == "["     
      bracket_tally +=1
      open << "brackets"
    elsif input[counter] == "{"
      curls_tally +=1
      open << "curls"
    elsif input[counter] == ")"
      parens_tally -=1
      return false if open.pop != "parens"      # Returns false if it closes when it should be opened before
    elsif input[counter] == "]"     
      bracket_tally -=1
      return false if open.pop != "brackets"
    elsif input[counter] == "}"
      curls_tally -=1
      return false if open.pop != "curls"
    end
    counter +=1
  end

  if open == []   # Checks if open is empty to see if all opens were closed.
    return true
  else 
    return false
  end
  
end



# FIND MISSING NUMBER
# ADD EM TOGETHER, THEN JUST SUBTRACT FROM AN ARRAY WITHOUT A MISSING...MUCHO MAS RAPIDO

string_missing_7    = (1..10000).reject { |x| x == 7 }.join(", ")
string_missing_4567 = (1..10000).reject { |x| x == 4567 }.join(", ")
string_missing_9999 = (1..10000).reject { |x| x == 9999 }.join(", ")

def find_missing_number(input)
  array = input.split(", ")                 # Creates an array out of the input. 
  counter=0                     
  while counter < array.length + 1
    counter +=1
    unless array.include?(counter.to_s)     # While loop keeps searching until it finds 
      break                                 # missing number, then it breaks the loop and  
    end                                     # returns the counter
  end
  counter
end



# PRODUCT OF AN ARRAY

def calculate_product (array)
  array.inject(:*) 
end

# ARRAY PRODUCT ODD NUMBERS ONLY

def calculate_product_odd (array)
  array.select{|x| x.odd?}.inject(:*)
end


# NUMBERS TO WORDS
 
def in_words number
  ones = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy',   'eighty', 'ninety']
  teens = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  array = []
  array = number.to_s.split("")
  array.reverse!
  
  answer = ""

  if array.length == 1
    answer << ones[number]
  elsif array.length == 2
    if array[1] == "1"
        answer << teens[number-10]
    else
      newnumber = 0
      newnumber += array[0].to_i 
      if 
        newnumber == 0
        answer << tens[number/10-1]
      else 
        answer << tens[number/10-1] + "-" + in_words(newnumber.to_i)
      end
    end
  elsif array.length == 3
    hundreds = array[2].to_i
    newnumber = 0
    newnumber += array[0].to_i + (array[1].to_i*10)
    if newnumber == 0
        answer << ones[hundreds-1] + " hundred"         
    else
      answer << ones[hundreds] + " hundred and " + in_words(newnumber.to_i)
    end
  elsif array.length == 4
    thousands = array[3].to_i
    newnumber = 0
    newnumber += array[0].to_i + (array[1].to_i*10) + (array[2].to_i*100)
    if newnumber == 0
        answer << ones[thousands] + " thousand"         
    else
      answer << ones[thousands] + " thousand, " + in_words(newnumber.to_i)
    end
  end
  return answer
end

p in_words(0) == "zero"
p in_words(1) == "one" 
p in_words(10) == "ten" 
p in_words(11) == "eleven" 
p in_words(20) == "twenty" 
p in_words(29) == "twenty-nine"
p in_words(30) == "thirty" 
p in_words(119) == "one hundred and nineteen"
p in_words(1000) == "one thousand"
p in_words(1559) == "one thousand, five hundred and fifty-nine"
p in_words(9999) == "nine thousand, nine hundred and ninety-nine"


# CREDIT CARD VALIDATOR METHOD

class CreditCard  
  def initialize(card_number)               
    @card_number = card_number.to_s         # Create a variable equal to the card number as a string
    raise ArgumentError.new("Card length is not 16 digits!") if @card_number.to_s.length != 16 # Check if it is a 16 digit number
  end
  def check_card
    array= []                                       # Create empty array
    @card_number.each_char { |x| array << x.to_i }  # Take each digit of the number into the array individually
    digits= ""                                      # Empty string to store the modified number
    array.each_with_index do |x, index|             
      x *= 2 if index % 2 == 0                      # If it is an even numbered index, double it 
      digits << x.to_s                              # Convert to string (VERY IMPORTANT OR HOURS WILL PASS) and push into the array
    end       
    sum = 0                                         # Create sum variable
    digits.split('').each { |x| sum += x.to_i }     # Add all digits into sum (Does the second and thrid steps of Luhm algorithim because it ignores the ten place)
    sum % 10 == 0                                   # Check if sum evenly divides by ten, return result
  end
end

# GUESSING GAME CLASS

class GuessingGame            # Create a new class "GuessingGame"
  def initialize(answer)      # Input is what the answer will be
    @@answer = answer         # Class variable = to the answer
    @@solved = false          # Class variable to store whether or not it has been solved, start with "false"
  end
  def guess(guess)                                            # Method with imput of a guess
      @@solved = false; return :high if guess > @@answer      # Returns high if greater than the answer, sets @@solved to false
      @@solved = false; return :low if guess < @@answer       # Returns low if less than the answer, sets @@solved to false 
      @@solved = true ; return :correct if guess == @@answer  # Returns correct if it is correct, sets @@solved to true
  end
  def solved?           # Method checking if it is sovled by returning @@solved
    return @@solved
  end
end

# LABELED DIE CLASS, #RANDOM

class Die
  def initialize(labels)                      # Creates a new "Die" with input "labels"
    raise ArgumentError if labels.length < 1  # Raises argument error is labels is empty
    @labels = labels                          # Makes input = to an instance variable
  end
 
  def sides                                   # Returns the length of labels (How many sides of this "die")
    @labels.length
  end
 
  def roll
    @labels.sample                            # Pulls a random value from labels (A roll of this "die")
  end
end


# RPN CALCULATOR

class RPNCalculator           # Create new class
  def evaluate (input)        # Method with input being the equation to solved
  array = []                  # Create empty array
  input = input.split         # Split the input string so it can be processed
  input.each do |x|           # Go through each x seeing if:
    case x  
      when /\d/               # If it is a digit, push it as a float into the array
        array << x.to_f       
      when "+", "-", "*"      # If it is an operation, push the result of the last number (Operation in question) the preceeding number  
        array << array.pop.send(x,array.pop)  # The pop returns and removes the last number, so when .pop is used again, it is a different number
    end  
  end
  array[0]                    # Return the solution, which is stored in the array
  end
end

# FIBONACCI NUM RECURSION

def is_fibonacci?(i, prev =0, fib =1)
  return false if i.is_a?(String)     # Added this to submit false if the input is a string
  return true  if  i == fib || i == 0 # True if i is = to the current value of fib, or if i is 0
  return false if fib > i             # False if fib is more than i, so if i is smaller than the true value
  is_fibonacci?(i, fib, fib += prev)  # Runs is_fibonacci? again if no criteria are met, however it advances 
end                                   # both prev and fib along the chain of true values before it is run again

# FIBONACCI NUM ITERATION

def is_fibonacci?(i, prev =0, fib =1)
  if i.is_a?(String)   # Added this to submit false if the input is a string
    return false    
  elsif  i == fib || i == 0
    return true 
  elsif fib > i  
    return false 
  else
    return is_fibonacci?(i, fib, fib += prev)
  end
end

# CIPPHER METHOD, NORTH KOREAN REFACTORING CHALLENGE
 
def north_korean_cipher(coded_message)
  input = coded_message.downcase        # Creates variable input equal to code_message with all characters in downcase
  decoded =[]                           # Creates empty array
  input.each_byte do |c|                # Convert each character to ascii then for each one:
    if c == 64 || c == 32 || c == 35 || c == 36 || c == 37 || c == 94 || c == 38 || c == 42 
       decoded << " "                   # If it is one of the "space" codes add a space
    elsif c > 96                        # If c is higher than 96  (a lower case letter)               
          ascii = c -=4                 # Make equal to var ascii c-4
          if ascii < 97                 # If this pushed c below the value of "a" it takes it back to the end
          ascii += 26                   
          end
        decoded << ascii.chr            # Push ascii, converted into a character, into decoded
    else 
      decoded << c.chr                  # If non "space" code or non-letter, just push original character into decoded
    end
  end  
    decoded2= decoded.join("")          # Make decoded2 variable decoded joined togeher
  if decoded2.match(/\d+/)              # Find any number
    decoded2.gsub!(/\d+/) { |num| num.to_i / 100 } #Divide any number by 100
  end  
  return decoded2                       # Return decoded2
end 
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"


# NUMERIC DIE CLASS, RANDOM

class Die
  def initialize(sides)
    if sides.is_a?(String) || sides.is_a?(Float)  # Deals with string of float inputs
      puts "Integer Please"
      return nil
    end 
    if sides < 1
      raise ArgumentError.new
    end
    @sides = sides
  end
  
  def sides
    return @sides
  end
  
  def roll
    return (rand(@sides)+1)
  end
end

# METHOD TO PAD ARRAY

class Array 
  def pad!(min_size, value = nil)
    x = min_size - self.length
    if x <= 0
      return self
    else 
      x.times do
      self << value
      end
      return self
    end
  end

  def pad(min_size, value = nil)
    y = self.clone
    x = min_size - self.length
    if x <= 0
      return y
    else 
      x.times do
      y.push << value
      end
      return y
    end
  end

end



# METHOD TO ADD COMMAS, # REGULAR

def separate_comma(number)
  if number.is_a?(Float)                                            #Checks if it is a float
    number.to_s                                                     #Turns it into a string
    num = /\./.match(number.to_s)                                   #Finds the decimal point, sets equal to num
    int= num.pre_match.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse #Does the .gsub only on the integer side of the float
    int << num.to_s << num.post_match                               #Pushes the pieces back together
  else number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse     #The .gsub for integers
  end
end 

# SSN METHODS
# 
def has_ssn?(string)
  (/\d{3}\-\d{2}\-\d{4}/) =~ string #Checks string for the SSN-pattern
end
 
# Return the Social Security number from a string.
def grab_ssn(string)
  string.slice(/\d{3}-\d{2}-\d{4}/) # Grabs the SSN-pattern out
end
 
# Return all of the Social Security numbers from a string
def grab_all_ssns(string)
  string.scan(/\d{3}-\d{2}-\d{4}/) #Scans string for all occurences of the SSN-pattern
end
 
# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  string.gsub(/\d{3}-\d{2}/), "XXX-XX" #Substitutes 3 digit- 2 digit patterns with "XXX-XX"
end
 
# Ensure all of the Social Security numbers use dashes for delimiters.
def format_ssns(string)  
    if string.match /\b\d{9}\b/              #If there is a 9 digit unbroken sequences
      string.gsub!(/(\d{3})(\d{2})(\d{4})/, '\1.\2.\3')   #Permanently add a period between the first three digits and the
    end                                                   #next two, then between the middle two and last four.
    string.gsub!(/\./, "-") #Permanently subsitute the .'s with -'s 
    return string #Returns the string, changed if it was changed, unchanged if it was unchanged
end
 
puts format_ssns("444.44.5555") == "444-44-5555" 
puts format_ssns("444.44.5555, AAA-AA-AAAA") == ("444-44-5555, AAA-AA-AAAA")



# MODE OF AN ARRAY

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


# MEDIAN OF AN ARRAY

def median(array)
  sorted = array.sort
  x = sorted.length
  return (sorted[(x - 1) / 2] + sorted[x / 2]) / 2.0
end


# AVERAGE OF AN ARRAY PLUS CASE METHOD, #GRADE

def get_grade(array)
  average = array.inject(:+)/array.length
  case average
    when 90..100
      "A"
    when 80..90
      "B"
    when 70..80
      "C"
    when 60..70
      "D"
    when 0..70
      "F"
    else
    "ERROR"
  end
end

# SUM OF AN ARRAY

def total(array)
  sum = 0
  array.each {|i| sum += i}
  return sum
end