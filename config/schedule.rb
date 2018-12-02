# set :output, "$HOME/get_twitter_data/cron_log.log"
set :output, {:error => '$HOME/Desktop/get_twitter_data/cron_error.log', :standard => '$HOME/Desktop/get_twitter_data/cron.log'}

every 1.hour do
  command "python3 $HOME/bitcoin_sentimental_analisys/chart_builder.py"
end
