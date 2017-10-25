class Route < ActiveRecord::Base
    has_many :rs_relationships
    has_many :stations, :through => :rs_relationships
end
