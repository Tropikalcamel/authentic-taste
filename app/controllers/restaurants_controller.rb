class RestaurantsController < ApplicationController


  # before_action :set_restaurant, only: %i[ show ]


  def index
    query = params[:query]
    @restaurants = Restaurant.search(query)

  end



  def show


  @teachers_img = [
           "https://ca.slack-edge.com/T02NE0241-UBGQCG2JD-222a98c74f2b-512",
      "https://ca.slack-edge.com/T02NE0241-U01HQR4JPM4-20d9378d3dcb-512",
      "https://ca.slack-edge.com/T02NE0241-U06CR7BS91Q-f7df05e9665e-512",
      "https://ca.slack-edge.com/T02NE0241-U02FW703QBZ-210ec2150a11-512",
      "https://ca.slack-edge.com/T02NE0241-U03MSB6Q5K9-78911f8cb499-512",
      "https://ca.slack-edge.com/T02NE0241-U04JCMS0ZL7-24d66ac6a3b7-512",
      "https://ca.slack-edge.com/T02NE0241-U03P0B0C5PA-f5f0db3f9bf3-512",
      "https://ca.slack-edge.com/T02NE0241-U044SCKU6E7-f85ccbd5e328-512",
      "https://ca.slack-edge.com/T02NE0241-U048PL8HTT7-a19e08ee8315-512",
      "https://ca.slack-edge.com/T02NE0241-U06DFAFSN3S-d30465e48bd3-512",
      "https://ca.slack-edge.com/T02NE0241-U06CS9BQMJ7-a4e509757996-512",
      "https://ca.slack-edge.com/T02NE0241-U06D7CH351P-9bb458d30860-512",
      "https://ca.slack-edge.com/T02NE0241-U06DX11KCFL-ee0d8b421f58-512",
      "https://ca.slack-edge.com/T02NE0241-U06CGG5KEBY-2a31d9ded926-512",
      "https://ca.slack-edge.com/T02NE0241-U06DE5PT35E-2cac8f43859c-512",
      "https://ca.slack-edge.com/T02NE0241-U027U71SASU-fba7a0beae17-512",
      "https://ca.slack-edge.com/T02NE0241-U06CLMD164E-fe25d4a12f87-512",
      "https://ca.slack-edge.com/T02NE0241-U06DN3DU3V4-60a7af975e3d-512",
      "https://ca.slack-edge.com/T02NE0241-U02T5QS004Q-d66a125e8dde-512",
      "https://ca.slack-edge.com/T02NE0241-U06CNAC0JNS-369f14326330-512",
      "https://ca.slack-edge.com/T02NE0241-U02FW703QBZ-210ec2150a11-512",
      "https://ca.slack-edge.com/T02NE0241-USL1K1LKA-94322c3f7d7c-512",
      "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1704627338/yxdohhlt7y1vynsnlwyo.jpg"
    ]




    # calculting the rating of authenthic user as two reviews,
    # and the result is a persantge
    review_sum = 0
    @restaurant = Restaurant.find(params[:id])
    @restaurant.reviews.each do |review|
      review_sum += review.rating * review.weight
      end
    total_weight = @restaurant.reviews.sum(:weight)
    @average_rating = (review_sum / total_weight.to_f).round(1)




    @reviewers = @restaurant.reviews.includes(:user).map(&:user)


    # show review

    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.all
    @sum_review = @restaurant.reviews.count


    @reviews.order(created_at:  :desc, rating: :desc)

    @review = Review.new
      # end
  end



  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
