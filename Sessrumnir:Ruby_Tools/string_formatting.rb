require_relative 'word_print_out'

module StringFormatting
  include WordPrintOut
  
  def ellipsify_string(string, length)
    shorten_string(string, length, '...')
  end

  def shorten_string(string, length, end_symbol = nil)
    if string.length > length
      "#{string[0..length]}#{end_symbol}"
    else
      string
    end
  end
end
