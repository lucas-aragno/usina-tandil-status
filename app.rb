require "sinatra"
require "sinatra/namespace"
require "json"

require_relative "lib/twitter"

module SlackUsinaTandil
  class App < Sinatra::Base
    register Sinatra::Namespace

    namespace "/api" do
      before do
        content_type "application/json"
      end

      get "/last_status" do
        twitter_client = TwitterClient.new
        last_tweet = twitter_client.get_last_tweet
        {message: last_tweet.text}.to_json    
      end
    end
  end
end