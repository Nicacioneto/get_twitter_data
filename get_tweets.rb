require 'twitter'
require 'json'
require 'byebug'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "4X5DsljoD5l2Ahc0AtuDETtJ1"
  config.consumer_secret     = "JSX6NP4BjCYUHM0pYhMLrmHD2Npy97tAmnG2Rghp1RK2y0zkVM"
  config.access_token        = "960905033423474689-YrKoOvKq6krAgClFh3pbbFkUd0eglYB"
  config.access_token_secret = "owtfhzRidnjkKSOIP1aGxWtIJzjzQeB6jBkuWtDiLvsP3"
end



topics = ["bitcoin", "btc", "satoshi"]
client.filter(track: topics.join(",")) do |object|
  current_day = DateTime.now.day
  file_name = "/home/nicacio_notebook/get_twitter_data/" + current_day.to_s
  tweets_stream = File.open(file_name, "a")
  if object.is_a?(Twitter::Tweet)
    hash = object.to_h
    tweets_stream.write(hash.to_json)
    tweets_stream.write("\n")
  end
end
