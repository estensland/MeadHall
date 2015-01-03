good_sample = <<-EOF
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

busted_period_space_after = <<-EOF
if quantitiy >= 9
  split.split
  array. join
end
EOF

busted_period_space_before = <<-EOF
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

rogue_new_line = <<-EOF
{cheese: 5, 'barth' => 'kool', foo: 'bar', 5 => 17
,
  
}
EOF
