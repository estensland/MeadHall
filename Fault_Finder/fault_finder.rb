sample = <<-EOF
if quantitiy >= 9
  puts "bob"
end
EOF

busted_period = <<-EOF
if quantitiy >= 9
  split.split
  array .join
end
EOF


def rogue_period(file)
  if file =~ (/\.(\s|\z|$)|(\s|\A|^)\./)
    file.split("\n").each_with_index do |row, index|
      if row.match(/\.(\s|\z|$)|(\s|\A|^)\./)
        indexicus = row =~ (/\.(\s|\z|$)|(\s|\A|^)\./)
        return "ROGUE PERIOD on line #{index + 1}\n- Index: #{indexicus}\n- \"#{row[indexicus-5..indexicus+6]}\""
      end
    end
  end
end

def extra_comma(file)
  if file =~ (/,\s*]/)
    return "ROGUE COMMA"
  end
end

def indent_finder(row, line)
  count = 0
  until row[count] != ' '
    count += 1
  end

  unless count % 2
    raise "improper indentation at line #{line}"
  end

  count / 2
end

puts rogue_period(busted_period)