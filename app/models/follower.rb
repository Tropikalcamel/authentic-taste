class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :followers_list
end
