class RsRelationship < ActiveRecord::Base
    belongs_to :station
    belongs_to :route
end
