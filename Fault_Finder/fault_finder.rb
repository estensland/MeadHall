sample = <<-EOF
if quantitiy >= 9
  puts "bob"
end
EOF

bad_indentation = <<-EOF
if quantitiy >= 9
 split.split
  array .join
end
EOF

missing_end = <<-EOF
if quantitiy >= 9
  split.split
  array .join
if 'chicken'
  return 5
else
  return '5'
end
EOF

busted_period = <<-EOF
if quantitiy >= 9
  split.split
  array .join
end
EOF

rogue_comma_array = <<-EOF
[1,2,3,4,5,
]
EOF

rogue_comma_hash = <<-EOF
{cheese: 5, 'barth' => 'kool', foo: 'bar', 5 => 17,}
EOF


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
