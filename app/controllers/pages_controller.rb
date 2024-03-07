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
end
