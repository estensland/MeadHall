module MiscRailsTools
  def pg_table_sizes
    query = <<EOF
    SELECT
      table_schema || '.' || table_name AS table_full_name,
      pg_size_pretty(pg_total_relation_size('"' || table_schema || '"."' || table_name || '"')) AS size
    FROM information_schema.tables
    ORDER BY
      pg_total_relation_size('"' || table_schema || '"."' || table_name || '"') DESC
EOF
    
    result = ActiveRecord::Base.connection.execute(query)
    
    result.to_a 
  end

  def drop_single_table(table)
    ActiveRecord::Base.connection.execute("DROP TABLE #{table}")
  end
end
