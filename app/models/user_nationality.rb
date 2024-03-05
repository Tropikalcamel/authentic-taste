class UserNationality < ApplicationRecord
  belongs_to :user
  belongs_to :nationality
end
