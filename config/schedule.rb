# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/home/nicacio/get_twitter_data/cron_log.log"
#
every 1.minutes do
  command "python3 $HOME/bitcoin_sentimental_analisys/candlestick_chart.py 13-10-dataframe.csv 2018-10-13-ts.txt"
  # runner "MyModel.some_method"
  # rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
