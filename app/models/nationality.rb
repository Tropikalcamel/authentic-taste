class Nationality < ApplicationRecord
  belongs_to :user
  belongs_to :Nationalities_list
end
