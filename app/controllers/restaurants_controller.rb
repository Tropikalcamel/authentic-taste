class RestaurantsController < ApplicationController
# before_action :set_restaurant, only: %i[ show show_review ]

  def index
  # Retrieve all restaurants
  @restaurants = Restaurant.all
  @top_restaurants = []

  # Calculate the average rating of all reviews
  average_rating = Review.pluck(:rating).sum / Review.count.to_f

  # Select restaurants that are above the average rating
  @restaurants.each do |restaurant|
    review_sum = restaurant.reviews.sum(:rating).to_f

    if review_sum / restaurant.reviews.length.to_f > average_rating
      @top_restaurants << restaurant
    end
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
  follower_params = { user_id: params[:user_id], taster_id: current_user.id }
  @follower = Follower.new(follower_params)
    if @follower.save
    end
    end


  def show_review
    @review = Review.all
    @review.pluck.order(created_at:  :desc, rating: :desc)
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
