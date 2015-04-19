module CustomRandomRails
  def pg_table_sizes
    query = <<EOF
    SELECT
      table_schema || '.' || table_name AS table_full_name,
      pg_size_pretty(pg_total_relation_size('"' || table_schema || '"."' || table_name || '"')) AS size
    FROM information_schema.tables
    ORDER BY
      pg_total_relation_size('"' || table_schema || '"."' || table_name || '"') DESC
EOF

    ActiveRecord::Base.connection.execute(query).to_a
  end

  # not tied to a class
  def drop_single_table(table)
    ActiveRecord::Base.connection.execute("DROP TABLE #{table}")
  end

  def ids_between(low, high)
    self.where(id: low..high)
  end

  def ids_under(num)
    self.where('id < ?', num)
  end
end



