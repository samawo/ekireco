class PrRelationship < ActiveRecord::Base
    belongs_to :prefecture
    belongs_to :route
end
