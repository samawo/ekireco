class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  mount_uploader :avatar, AvatarUploader #deviseの設定配下に追記
  
  has_many :us_relationships, dependent: :destroy
  has_many :stations, :through => :us_relationships
         
  has_many :complete_prefectures, dependent: :destroy
  has_many :prefectures, :through => :complete_prefectures
  
  has_many :complete_routes, dependent: :destroy
  has_many :routes, :through => :complete_routes
  
  has_many :station_comments, dependent: :destroy
  has_many :route_comments, dependent: :destroy
  has_many :prefecture_comments, dependent: :destroy
  
   # 暗号化
  def self.encrypt(password)
    crypt = ActiveSupport::MessageEncryptor.new(ENV["SECURE"], ENV["CIPHER"])
    crypt.encrypt_and_sign(password)
  end

  # 復号化
  def self.decrypt(password)
    crypt = ActiveSupport::MessageEncryptor.new(ENV["SECURE"], ENV["CIPHER"])
    crypt.decrypt_and_verify(password)
  end

  
  
  def self.create_unique_string
    SecureRandom.uuid
  end       
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(
          name:     auth.extra.raw_info.name,
          provider: auth.provider,
          uid:      auth.uid,
          token:    auth.credentials.token,
          email:    "#{auth.uid}-#{auth.provider}@example.com",
          image_url:   auth.info.image,
          password: Devise.friendly_token[0, 20]
      )
      user.token=encrypt(user.token)
      #user.skip_confirmation!
      user.save(validate: false)
      Prefecture.all.each do |prefecture|
        user.complete_prefectures.build(prefecture_id: prefecture.id).save
      end
      Route.all.each do |route|
        user.complete_routes.build(route_id: route.id).save
      end
    end
    user
  end
  
  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(
          name:     auth.info.name,##S
          image_url: auth.info.image,
          provider: auth.provider,
          uid:      auth.uid,
          token:    auth.credentials.token,
          secret:   auth.credentials.secret,
          email:    "#{auth.uid}-#{auth.provider}@example.com",
          password: Devise.friendly_token[0, 20]
      )
      user.token=encrypt(user.token)
      user.secret=encrypt(user.secret)
      user.save
      Prefecture.all.each do |prefecture|
        user.complete_prefectures.build(prefecture_id: prefecture.id).save
      end
      Route.all.each do |route|
        user.complete_routes.build(route_id: route.id).save
      end
    end
    user
  end
  
  def update_with_password(params, *options)
    if provider.blank?
      super
    else
      params.delete :current_password
      update_without_password(params, *options)
    end
  end
  
  def access!(station)
    us_relationships.create!(station_id: station.id)
  end
  
  def accessing?(station)
    us_relationships.find_by(station_id: station.id)
  end
  
  def unaccess!(station)
    us_relationships.find_by(station_id: station.id).destroy
  end
  
  
 
end
