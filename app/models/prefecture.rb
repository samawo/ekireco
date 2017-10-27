class Prefecture < ActiveRecord::Base
    has_many :stations
    
    has_many :complete_prefectures
    has_many :user_id, :through => :complete_prefectures
    
    has_many :prefecture_comments, dependent: :destroy
end
