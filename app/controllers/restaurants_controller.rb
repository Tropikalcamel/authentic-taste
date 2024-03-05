class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @top_restaurants = []

    #calculates average of all restaurants
    average = (Review.pluck(:rating).sum / Review.count.to_f).round(1)

         # calculates and selects restaurants that are above average
    @restaurants.each do |restaurant|
      review_sum = 0
      restaurant.reviews.each do |review|
        review_sum += review.rating
      end
      if (review_sum/restaurant.reviews.length.to_f).round(1) > average
        @top_restaurants << restaurant
      end
      raise
    end
  end



  #   @reviews = Review.all
  #   @top_tasters = []
  #       @review.user each do |review|
  #         review_sum = 0
  #       end
  #  end

  #  end
  #   @top_tasters << tasters
  # end
  #  end
  #   end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
