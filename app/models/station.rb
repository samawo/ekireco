class Station < ActiveRecord::Base
    belongs_to :prefecture
    has_many :rs_relationships
    has_many :routes, :through => :rs_relationships
end
