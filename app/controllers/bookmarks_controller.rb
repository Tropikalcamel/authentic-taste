class BookmarksController < ApplicationController
  before_action :set_restaurant, only: %i[ new create edit update destroy]
  def show
    @bookmark= Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
       @bookmark.user = current_user
    @bookmark.restaurant = @restaurant
      if @bookmark.save
      redirect_to profile_path
      # needs to go confiramtion page
    else
      render "bookmark/new", status: :unprocessable_entity
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
  @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      # Handle successful update
      redirect_to profile_path, notice: 'Review was successfully updated.'
    else
      # Handle validation errors or other errors
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def reviews_params
    params.require(:review).permit( :restaurant_id, :user_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
