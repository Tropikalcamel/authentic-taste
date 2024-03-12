class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: %i[ show ]

  def index
    #top restaurants
    end

  def show
    # calculting the rating of authenthic user as two reviews,
    # and the result is a persantge
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.reviews.each do |review|
      review_sum += review.rating * review.weight
    end
    total_weight = @restaurant.reviews.sum(:weight)
    @average_rating = (review_sum / total_weight.to_f).round(1)

    # follower taster method method
    follower_params = { user_id: current_user.id , taster_id:params[:user_id]}
    @follower = Follower.new(follower_params)
      if @follower.save
    # show review
    @review = Review.all
      @review.pluck.order(created_at:  :desc, rating: :desc)
      end
      end



  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
