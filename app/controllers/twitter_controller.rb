class TwitterController < ApplicationController
  require 'twitter'
  def tweet
    auth = request.env["omniauth.auth"]
    client = Twitter.configure do |config|
      # applicationの設定
      config.consumer_key         = ENV['TWITTER_ID_PRODUCTION']
      config.consumer_secret      = ENV['TWITTER_SECRET_PRODUCTION']
      # ユーザー情報の設定
      #user_auth = current_user.authentications.first
      #config.access_token         = user_auth.token
      #config.access_token_secret  = user_auth.secret
      config.access_token         = auth.credentials.token
      config.access_token_secret  = auth.credentials.secret
    end
    # Twitter投稿
    client.update("test")
    redirect_to root_path, notice: 'ツイートしました！'
  end
end
