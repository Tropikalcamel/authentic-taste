class UsersController < ApplicationController
  before_action :set_restaurant, only: %i[ top_tasters ]
end
  

# @booking = Booking.new(booking_params)
# @booking.user = current_user
# @booking.restaurant = @restaurant
#   if @booking.save
#   redirect_to profile_path
#   # needs to go confiramtion page
# else
#   render "bookings/new", status: :unprocessable_entity
# end
# end
