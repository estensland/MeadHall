module SSN
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
    string.gsub(/\d{3}-\d{2}/, "XXX-XX") #Substitutes 3 digit- 2 digit patterns with "XXX-XX"
  end

  # Ensure all of the Social Security numbers use dashes for delimiters.
  def format_ssns(string)
      if string.match(/\b\d{9}\b/)              #If there is a 9 digit unbroken sequences
        string.gsub!(/(\d{3})(\d{2})(\d{4})/, '\1.\2.\3')   #Permanently add a period between the first three digits and the
      end                                                   #next two, then between the middle two and last four.
      string.gsub!(/\./, "-") #Permanently subsitute the .'s with -'s
      return string #Returns the string, changed if it was changed, unchanged if it was unchanged
  end

end

# include SSN
# puts format_ssns("444.44.5555") == "444-44-5555"
# puts format_ssns("444.44.5555, AAA-AA-AAAA") == ("444-44-5555, AAA-AA-AAAA")