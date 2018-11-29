require 'daemons'

options = {
  :app_name   => "tweets_streamer",
  :backtrace  => true,
  :monitor    => true,
}

Daemons.run('tweets_streamer.rb', options)
