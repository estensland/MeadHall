require_relative 'samples'

def simple_def_end_check(file)
  def_count = file.scan(/def/).count
  end_count = file.scan(/end/).count
  return false if def_count > end_count
end

def simple_do_end_check(file)
  do_count = file.scan(/do/).count
  end_count = file.scan(/end/).count
  return false if do_count > end_count
end

def rogue_period(file)
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

def extra_comma(file)
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

puts extra_comma(rogue_comma_array)
