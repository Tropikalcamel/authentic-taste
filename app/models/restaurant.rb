class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :boomarks
  
end
