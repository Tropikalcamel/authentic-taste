class UserNationality < ApplicationRecord
  belongs_to :user 
  has_one :nationality
end
