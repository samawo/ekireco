class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
        @stations=@user.stations
        @routes=@user.routes.sort{|a,b| a.id<=>b.id}
        @prefectures=@user.prefectures.sort{|a,b| a.id<=>b.id}
    end
end
