require 'twitter'
require 'byebug'
require 'pg'

begin
    con = PG.connect :dbname => 'testdb', :user => 'nicacio'
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "4X5DsljoD5l2Ahc0AtuDETtJ1"
      config.consumer_secret     = "JSX6NP4BjCYUHM0pYhMLrmHD2Npy97tAmnG2Rghp1RK2y0zkVM"
      config.access_token        = "960905033423474689-YrKoOvKq6krAgClFh3pbbFkUd0eglYB"
      config.access_token_secret = "owtfhzRidnjkKSOIP1aGxWtIJzjzQeB6jBkuWtDiLvsP3"
    end

    topics = ["bitcoin", "btc", "satoshi"]
    client.filter(track: topics.join(",")) do |object|
      if object.is_a?(Twitter::Tweet)
        stm = "INSERT INTO Tweets (Text, Date) VALUES($1, $2)"
        rs = con.exec_params(stm, [object.text, object.created_at])
      end
    end

rescue PG::Error => e
    puts e.message
    con = PG.connect :dbname => 'testdb', :user => 'nicacio'
end
