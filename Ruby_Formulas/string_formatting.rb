module WordPrintOut

  def in_words
    number = self

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

  def separate_comma
    number = self
    if number.is_a?(Float)                                            #Checks if it is a float
      number.to_s                                                     #Turns it into a string
      num = /\./.match(number.to_s)                                   #Finds the decimal point, sets equal to num
      int= num.pre_match.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse #Does the .gsub only on the integer side of the float
      int << num.to_s << num.post_match                               #Pushes the pieces back together
    else number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse     #The .gsub for integers
    end
  end 
end
