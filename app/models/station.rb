class Station < ActiveRecord::Base
    belongs_to :prefecture
    has_many :rs_relationships
    has_many :routes, :through => :rs_relationships
    
    has_many :us_relationships
    has_many :users, :through => :us_relationships
    
    has_many :station_comments, dependent: :destroy
end
