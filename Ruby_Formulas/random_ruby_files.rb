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
