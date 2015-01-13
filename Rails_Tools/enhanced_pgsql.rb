module DBHeavyLifting

  def drop_single_table(table)
    ActiveRecord::Base.connection.execute("DROP TABLE #{table}")
  end
end
