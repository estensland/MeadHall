# Chunk table data into a hash

table_data = ""

x = table_data.gsub(/(<tr>|<td>)/, '').split('</tr>').map do |row|
  traits = row.split('</td>').map(&:strip)
  {"" => traits[0], "" => traits[1]}
end

p x

