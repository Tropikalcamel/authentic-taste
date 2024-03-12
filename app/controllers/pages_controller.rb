class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def profile
    # show reviews
    @reviews = current_user.reviews

    # show_bookmarks
    @bookmarked_restaurants = current_user.bookmarks
  end

  def taster
    # show_favourite
    @user = User.find(params[:id])
    @favourite= @user.restaurants

    # show reviews
      @reviews = @user.reviews.last(3)
  end

  def home


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



  end
end
