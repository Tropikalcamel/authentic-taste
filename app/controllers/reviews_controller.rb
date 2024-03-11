class ReviewsController < ApplicationController

  before_action :set_restaurant, only: %i[ new create ]

  def show
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    # (review_params)
    @review.user = current_user
    @review.restaurant = @restaurant
      if @review.save
      redirect_to profile_path
      # needs to go confiramtion page
    else
      render "review/new", status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  @review = Review.find(params[:id])
    if @review.update(review_params)
      # Handle successful update
      redirect_to profile_path, notice: 'Review was successfully updated.'
    else
      # Handle validation errors or other errors
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def reviews_params
    params.require(:review).permit( :rating, :service)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
