class BookmarksController < ApplicationController
  before_action :set_restaurant, only: %i[ new create edit update destroy]

  def show
    @bookmark = Bookmark.find_by(restaurant_id: params[:restaurant_id], user: current_user)
    @bookmark= Bookmark.all
  end

  def index
    bookmarks = Bookmark.where(user_id: current_user.id)
    @restaurants = []

    bookmarks.each do |bookmark|
      @restaurants << bookmark.restaurant
    end

  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.restaurant = @restaurant
    respond_to do |format|

      if @bookmark.save
        format.html { redirect_to monument_path(@bookmark) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "monuments/new", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
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
    bookmark = Bookmark.find_by(restaurant_id: params[:restaurant_id], user: current_user)
    bookmark.destroy!
    #@bookmark.destroy
    #redirect_to profile_path, status: :see_other
  end

  private

  def reviews_params
    params.require(:review).permit( :restaurant_id, :user_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
