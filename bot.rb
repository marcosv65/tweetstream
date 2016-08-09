@client  = TweetStream::Client.new

puts "[STARTING] bot..."
@client.userstream() do |status| 

if !status.retweet? && 
   status.in_reply_to_user_id? && status.in_reply_to_user_id == ACCOUNT_ID &&
   status.text[-1] == "?"

     tweet = {
       "status" => "@#{status.user.screen_name} " + %w(Sim Não Talvez).sample,
       "in_reply_to_status_id" => status.id.to_s
     }

     # Aqui vai o código que posta a resposta no twitter (apresentado abaixo)
 end
end
