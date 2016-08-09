@client  = TweetStream::Client.new

puts "[STARTING] bot..."
@client.userstream() do |status| 

if !status.retweet? && 
   status.in_reply_to_user_id? && status.in_reply_to_user_id == ACCOUNT_ID &&
   status.text[-1] == "?"

     tweet = {
       "status" => "@#{status.user.screen_name} " + %w(https://pbs.twimg.com/media/Cpc88o-XgAErOzK.jpg:large).sample,
       "in_reply_to_status_id" => status.id.to_s
     }

     twurl = URI.parse("https://api.twitter.com/1.1/statuses/update.json")
     authorization = SimpleOAuth::Header.new(:post, twurl.to_s, tweet, OAUTH)

     http = EventMachine::HttpRequest.new(twurl.to_s).post({
       :head => {"Authorization" => authorization},
       :body => tweet
     })
     http.errback {
       puts "[CONN_ERROR] errback"
     }
     http.callback {
       if http.response_header.status.to_i == 200
         puts "[HTTP_OK] #{http.response_header.status}"
       else
         puts "[HTTP_ERROR] #{http.response_header.status}"
       end
     }

 end
end
