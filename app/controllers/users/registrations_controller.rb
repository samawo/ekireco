class Users::RegistrationsController < Devise::RegistrationsController
  after_action :setComplete ,only: [:create]
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
  
  def create
    super
  end
  
  
  def setComplete
    Prefecture.all.each do |prefecture|
      @user.complete_prefectures.build(prefecture_id: prefecture.id).save
    end
    Route.all.each do |route|
      @user.complete_routes.build(route_id: route.id).save
    end
  end
end