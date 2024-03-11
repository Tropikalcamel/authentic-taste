class RestaurantsController < ApplicationController

  # before_action :set_restaurant, only: %i[ show show_review ]

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
    end

    # top users
    @top_users = User.joins(:reviews)
              .group(:id)
              .order('COUNT(reviews.id) DESC')
              .limit(5)


    # reviews of the week
    @followers_reviews = Review.joins(user: :followers)
                .where(followers: { taster_id: current_user.id} ).order(created_at: :desc)
                .limit(10)
raise

    # search method
    @restaurants = Restaurant.all
  if params[:query].present?
    @restaurants = @restaurants.where("neighborhood ILIKE ?", "%#{params[:query]}%")

  # follow restaurant method
    @user = current.user
    @boomarks = Bookmark.new
        @bookmark.current.user = @bookmark
        if @bookmark.save
      redirect_to profile_path
      end
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
end
