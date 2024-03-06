class RestaurantsController < ApplicationController
  def index
    #top restaurants
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
# top users
      top_users = User.joins(:reviews)
                .group(:id)
                .order('COUNT(reviews.id) DESC')
                .limit(5)
      raise
    end
  end

# # top tasters method
#   @reviews = Review.all
#   @top_tasters = []


#   @review.each do |review|
#     review_sum = 0
#     review.user.each do |review|
#     review_sum  += review.user
#     end
#     if (review_sum/user.reviews.length)
#         @top_tasters << review
#     end
# # top tasters method 2
#   @users = User.all
#   @top_tasters = []

#   @user.each do |user|
#     review_sum = 0
#     user.review.each do |review|
#       review_sum += user.review.count
#     end
#     if (review_sum user.reviews.length)
#       @top_tasters << user

#     end
#   end



#     end
#   end


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
