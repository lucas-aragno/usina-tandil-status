require "twitter"
require "dotenv/load"

class TwitterClient
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end
  end

  def get_last_tweet
    options = {count: 1, include_rts: false}
    @client.user_timeline("UsinaTandil", options).first
  end
end