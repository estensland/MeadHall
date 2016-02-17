require_relative 'word_print_out'

module StringFormatting
  include WordPrintOut
  
  def shorten_string(string, length)
    if string.length > length
      "#{string[0..length]}..."
    else
      string
    end
  end
end
