class Relationship < ApplicationRecord
  belongs_to :follower, calss_name: "Customer"
  belongs_to :followed, calss_name: "Customer"
  validates :follower_id, preence: ture
  validates :followed_id, preence: ture
end
