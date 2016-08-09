require "rubygems"
require "tweetstream"
require "em-http-request"
require "simple_oauth"
require "json"
require "uri"

# config oauth
OAUTH = {
 :consumer_key => "EDIT_HERE",
 :consumer_secret => "EDIT_HERE",
 :token => "EDIT_HERE",
 :token_secret => "EDIT_HERE"
}
ACCOUNT_ID = OAUTH[:token].split("-").first.to_i

TweetStream.configure do |config|
 config.consumer_key       = OAUTH[:consumer_key]
 config.consumer_secret    = OAUTH[:consumer_secret]
 config.oauth_token        = OAUTH[:token]
 config.oauth_token_secret = OAUTH[:token_secret]
 config.auth_method = :oauth
end
