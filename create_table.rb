#!/usr/bin/ruby
require 'pg'

begin
    con = PG.connect :dbname => 'testdb', :user => 'nicacio'
    con.exec "DROP TABLE IF EXISTS Tweets"
    con.exec "CREATE TABLE Tweets(Id SERIAL PRIMARY KEY,Text VARCHAR(280), Date TIMESTAMP)"
rescue PG::Error => e
    puts e.message
ensure
    con.close if con
end
