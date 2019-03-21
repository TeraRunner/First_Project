require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({
        dbname: 'd51km7esu67snm',
        host: 'ec2-54-247-70-127.eu-west-1.compute.amazonaws.com',
        port: 5432,
        user: 'ivuvghgghqsknp',
        password: 'de6083fc151c8c5df85b38fa6244291977d6faca13d0e5c48890021874354b78'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
