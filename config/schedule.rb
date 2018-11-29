set :output, "$HOME/get_twitter_data/cron_log.log"

every 1.hour do
  command "python3 $HOME/bitcoin_sentimental_analisys/chart_builder.py"
end
