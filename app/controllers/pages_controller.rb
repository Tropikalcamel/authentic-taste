class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
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


    # search method
    @restaurants = Restaurant.all
        if params[:query].present?
        @restaurants = @restaurants.where("neighborhood ILIKE ?", "%#{params[:query]}%")

    # follow restaurant method


    # specific restaurant rating
     


    end
  end

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
end
