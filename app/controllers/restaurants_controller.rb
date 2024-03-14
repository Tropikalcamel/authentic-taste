class RestaurantsController < ApplicationController


  # before_action :set_restaurant, only: %i[ show ]


  def index
  end



  def show
    # calculting the rating of authenthic user as two reviews,
    # and the result is a persantge
    review_sum = 0
    @restaurant = Restaurant.find(params[:id])
    @restaurant.reviews.each do |review|
      review_sum += review.rating * review.weight
      end
    total_weight = @restaurant.reviews.sum(:weight)
    @average_rating = (review_sum / total_weight.to_f).round(1)




    @reviewers = @restaurant.reviews.includes(:user).map(&:user)


    # show review

    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.all
    @sum_review = @restaurant.reviews.count


    @reviews.order(created_at:  :desc, rating: :desc)

    @review = Review.new
      # end
  end



  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
