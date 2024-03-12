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

  # Retrieve top users
  @top_users = User.joins(:reviews)
                    .group(:id)
                    .order('COUNT(reviews.id) DESC')
                    .limit(5)

  # Retrieve reviews of the week for a specific user (taster_id: 49)
  @followers_reviews = Review.joins(user: :followers)
                             .where(followers: { taster_id: 49 })
                             .order(created_at: :desc)
                             .limit(3)

  # Search method
  if params[:query].present?
    @restaurants = @restaurants.where("neighborhood ILIKE ?", "%#{params[:query]}%")
  end

  # Follow restaurant method (I'm assuming this logic will be applied elsewhere)
  # This code snippet seems out of context and might need adjustments
  if params[:id].present?
    @user = User.find(params[:id])
    @boomarks = Bookmark.new
    @bookmark.user = @bookmark
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
