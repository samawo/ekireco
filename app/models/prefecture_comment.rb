class PrefectureComment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  belongs_to :prefecture
end
