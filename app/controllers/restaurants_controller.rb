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

      # reviews of the week
      followers_reviews = Review.joins(user: :followers)
                  .where(followers: { taster_id: 49} ).order(created_at: :desc)
                  .limit(3)
# search method
                  @restaurants = Restaurant.all
  if params[:query].present?
    @restaurants = @restaurants.where("neighborhood ILIKE ?", "%#{params[:query]}%")
# follow method
  @user = User.find(params [:id])
  
    end
end

  def show
    # calculting the rating of authenthic user as two reviews,
    # and the result is a persantge
    @restaurant = Restaurant.find(params[:id])
    @restaurant.reviews.each do |review|
      review_sum += review.rating * review.weight
    end
    total_weight = @restaurant.reviews.sum(:weight)
    @average_rating = (review_sum / total_weight.to_f).round(1)
  end


  def review_scale
    # the rating scale in an decnding order
    @restaurant = Restaurant.find(params[:id])
    @sorted_reviews = @restaurant.reviews.order(rating: :desc)
    end

  end

  def authentic_badge
    # determines if the restaurant has a authentic badge
    @restaurant = Restaurant.find(params[:id])
    @authentic_badge = @restaurant.authentic_badge? ? "authentic_badge" : "no_badge"

  end


end

# user.nationalities.each do |nationality|
#   if nationality.name == restaurant.cuisine
#     weight= 2
