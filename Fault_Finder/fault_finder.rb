require_relative 'samples'

class FaultFile
  attr_reader :file
  
  def initialize(file)
    @file = file
  end

  def simple_def_end_check
    def_count = get_count('def')
    end_count = get_count('end')
    return false if def_count > end_count
  end
  
  def simple_do_end_check
    do_count = get_count('do')
    end_count = get_count('end')
    return false if do_count > end_count
  end
  
  def basic_end_check
    def_count = get_count('def')
    do_count = get_count('do')
    end_count = get_count('end')
    return false if def_count + do_count > end_count
  end
  
  def bracket_check
    get_count('[') == get_count(']')
  end
  
  def parens_check
    get_count('(') == get_count(')')
  end
  
  def curly_check
    get_count('{') == get_count('}')
  end
  
  def order_op_sign_counts_check 
    bracket_check && parens_check && curly_check
  end
  
  def get_count(string)
    file.scan(string).count
  end
  
  def rogue_period
    if file =~ (/\.(\s|\z|$)|(\s|\A|^)\./)
      file.split("\n").each_with_index do |row, index|
        if indexicus = row =~ (/\.(\s|\z|$)|(\s|\A|^)\./)
          return "ROGUE PERIOD on line #{index + 1}\n- Line Index: #{indexicus}\n- \"#{row[indexicus-5..indexicus+6]}\""
        end
      end
    else
      'No Rogue Periods'
    end
  end
  
  def extra_comma
    if indexicus = file =~ (/,\s*\]/)
      "ROGUE COMMA IN ARRAY\n- Whole String Index: #{indexicus}\n- \"#{file[indexicus-5..indexicus+6]}\""
    elsif indexicus = file =~ (/,\s*\}/)
      "ROGUE COMMA IN HASH\n- Whole String Index: #{indexicus}\n- \"#{file[indexicus-5..indexicus+6]}\""
    else
      'No Rogue Commas'
    end
  end
  
  def indent_finder(row, line)
    count = 0
    until row[count] != ' '
      count += 1
    end
  
    unless count % 2
      return "Non-Even indentation at line #{line}"
    end
  
    count / 2
  end

end

puts extra_comma(rogue_comma_array)
