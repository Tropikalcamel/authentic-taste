class UsersController < ApplicationController
  before_action :set_restaurant, only: %i[ top_tasters ]
end

