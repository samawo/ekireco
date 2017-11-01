class Route < ActiveRecord::Base
    has_many :rs_relationships
    has_many :stations, :through => :rs_relationships
    
    has_many :complete_routes
    has_many :users, :through => :complete_routes
    
    has_many :route_comments, dependent: :destroy
    
    has_many :pr_relationships
    has_many :prefectures, :through => :pr_relationships
end
