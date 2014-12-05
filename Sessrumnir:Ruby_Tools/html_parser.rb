# For translating data from an html table into a hash

def table_parse(table_data, attrs)
  table_data.gsub(/(<tr>|<td>)/, '').split('</tr>').map do |row|
    traits = row.split('</td>').map(&:strip)
    result = {}
    
    attrs.each.with_index do |attrib, index|
      result[attrib] = traits[index]
    end
    
    result
  end
end

