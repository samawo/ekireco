class PrefectureComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prefecture
end
