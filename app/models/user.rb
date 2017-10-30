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
          email:    "#{auth.uid}-#{auth.provider}@example.com",
          image_url:   auth.info.image,
          password: Devise.friendly_token[0, 20]
      )
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
          name:     auth.info.nickname,##S
          image_url: auth.info.image,
          provider: auth.provider,
          uid:      auth.uid,
          email:    "#{auth.uid}-#{auth.provider}@example.com",
          password: Devise.friendly_token[0, 20]
      )
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
#    cp=current_user.complete_prefectures.find_by(prefecture_id: station.prefecture_id)
#    cp.number=cp.number-1
#    cp.complete_prefectures.complete=false
#    cp.save
#    crs=current_user.complete_routes.find_by(route_id: station.route_id)
#    crs.each do |cr|
#      cr.number=cr.number-1
#      cr.complete_routes.complete=true
#      cr.save
#    end
  end
end
