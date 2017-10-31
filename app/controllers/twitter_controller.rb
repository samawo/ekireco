class TwitterController < ApplicationController
  
  def tweet
    require 'twitter'
    #auth = request.env["omniauth.auth"]
    client = Twitter::REST::Client.new do |config|
      # applicationの設定
      config.consumer_key         = ENV['TWITTER_ID_PRODUCTION']
      config.consumer_secret      = ENV['TWITTER_SECRET_PRODUCTION']
      # ユーザー情報の設定
      #user_auth = current_user.authentications.first
      #config.access_token         = user_auth.token
      #config.access_token_secret  = user_auth.secret
      config.access_token         = User.decrypt(current_user.token)
      config.access_token_secret  = User.decrypt(current_user.secret)
      #config.access_token         = current_user.token
      #config.access_token_secret  = current_user.secret
    end
    precount=0
    current_user.complete_prefectures.each do |n|
      if n.number!= 0
        precount=precount+1
      end
    end
    precomp=0
    current_user.complete_prefectures.each do |n|
      if n.number!= 0
        precomp=precomp+1
      end
    end
    routecount=0
    current_user.complete_prefectures.each do |n|
      if n.number!= 0
        routecount=routecount+1
      end
    end
    routecomp=0
    current_user.complete_prefectures.each do |n|
      if n.number!= 0
        routecomp=routecomp+1
      end
    end
    
     # Twitter投稿
    twiText="現在のステータス\nアクセス都道府県数："
    twiText+=string(precount)
    twiText+="\n制覇都道府県数："
    twiText+=string(precomp)
    twiText+="\nアクセス路線数："
    twiText+=string(routecount)
    twiText+="\n制覇路線数："
    twiText+=string(routecomp)
    twiText+="\nアクセス駅数："
    twiText+=string(routecomp)
    twiText+="\nhttps://station-record.herokuapp.com/users/"
    twiText+=string(current_user.id)
    client.update(twiText)
    redirect_to root_path, notice: 'ツイートしました！'
  end
end
