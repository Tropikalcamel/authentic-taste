class Nationality < ApplicationRecord
  belongs_to :user_nationalities, optional: true
end
