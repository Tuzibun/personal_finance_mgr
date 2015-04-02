require 'pg'

db_conn = PG.connect(:dbname => 'pfm', :host => 'localhost')

file = File.new("data.csv", "a+")

file.each do |line|
  transaction = line.split(",")
  date = transaction[0].gsub("'","")
  account = transaction[1]
  payee = transaction[2]
  category = transaction[3]
  type = transaction[4]

  sql  = "INSERT INTO transactons (date, account, payee, cateogory, type)"
  sql += "VALUES ( '#{date}', '#{account}', '#{payee}', '#{category}', '#{type}');"

  db_conn.exec(sql)

end

file.close

db_conn.close
