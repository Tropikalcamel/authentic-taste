class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @restaurants = Restaurant.all
    @top_restaurants = []

  @restaurants.each do |restaurant|
  review_sum = 0

  restaurant.reviews.each do |review|
     if review.rating.present?
      review_sum += review.rating
    end
  end

  average_rating = (review_sum / restaurant.reviews.count.to_f).round(1)

  if average_rating > 4
    @top_restaurants << restaurant
  end
end


@top_restaurants_last_week = []

@restaurants.each do |restaurant|
  review_sum_last_week = 0

  restaurant.reviews.where(created_at: 1.week.ago..Time.now).each do |review|
    if review.rating.present?
      review_sum_last_week += review.rating
    end
  end

  average_rating_last_week = (review_sum_last_week / restaurant.reviews.where(created_at: 1.week.ago..Time.now).count.to_f).round(1)

  if average_rating_last_week > 4
    @top_restaurants_last_week << restaurant
  end
end


    @image_urls = [
      "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1705658652/vqsr5vfilkemiywrdect.jpg",
      "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1708965939/gnszknkyze7rke7xo0yd.jpg",
      "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1704627338/yxdohhlt7y1vynsnlwyo.jpg",
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
    ]

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



    @fake_reviews = [
      "Stepped into a restaurant where the food was so good, I momentarily considered proposing to the chef. The ambiance was so charming, I half-expected the menu to break into a stand-up comedy routine. Overall, a dining experience so delightful, I'm already planning my next meal there... and the one after that!",
      "Visited a restaurant with such captivating ambiance that even the salt and pepper shakers were dancing salsa! The food was so good, I almost asked for its autograph. Would definitely go back, if only to witness the culinary magic show again!",
      "Prepare to be 'shell-shocked' by the 'crabtivating' flavors at this crustacean wonderland! With each bite, I felt like I was 'clawing' my way into gastronomic bliss. The ambiance? 'Clam-tastic!' It's a place where even the snails would 'shell' out a five-star rating!",
      "Entering this restaurant felt like stepping into a time machine set for 'culinary delight'! From the moment I sank my teeth into their signature dish, I knew I was in for a 'taste bud teleportation.' The ambiance was so cozy, I half-expected to find a hidden portal to Flavor Town behind the dessert counter! A meal here is like a 'delicious voyage' through the annals of gastronomic history!",
      "Imagine if Willy Wonka decided to open a restaurant instead of a chocolate factory – that's exactly what dining here feels like! From the whimsical décor to the mind-boggling menu items, every moment was like a playful dance with my taste buds. I half-expected Oompa Loompas to pop out and serenade us with food-themed songs! If you're in the mood for a culinary adventure that's equal parts magic and flavor, this place is an absolute must-visit!",
      "Stepping into this restaurant was like entering a portal to Flavor Town – except instead of Guy Fieri, we were greeted by a friendly waiter with a penchant for puns and a menu that read like a love letter to gastronomy. Each dish was a work of art, so delicious that I almost felt guilty for devouring it! If food were a religion, this place would be the holy grail. Just be warned: once you taste their signature dish, you'll be planning your next pilgrimage before you even finish your meal!"
    ]
    # You

    # Your other code

    @fake_profile_text = [
      "Foodie extraordinaire, on a mission to uncover the world's hidden culinary treasures. With taste buds tuned to perfection, they savor every bite like it's the last chapter of a delicious novel.",
      "With an appetite as big as their heart, they navigate life one meal at a time, turning every dining experience into an adventure worth savoring.",
      "With a palate that rivals a seasoned chef's, they're on a perpetual quest for the perfect bite, making every meal an epicurean journey filled with joy and flavor.",
      "With taste buds tuned to perfection, they dance through cuisines like a culinary connoisseur, turning meals into delightful adventures and memories into delicious anecdotes."
    ]





    # top users
    @top_users = User.joins(:reviews)
              .group(:id)
              .order('COUNT(reviews.id) DESC')
              .limit(5)


    # reviews of the week
    @reviews_of_the_week = Review.joins(user: :followers)
                &.where(followers: { taster_id: current_user.id} ).order(created_at: :desc)
                .limit(10)

    # search method
    @restaurants = Restaurant.all
        if params[:query].present?
        @restaurants = @restaurants.where("neighborhood ILIKE ?", "%#{params[:query]}%")

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



    #calculates average of all restaurants
    # average = (Review.pluck(:rating).sum / Review.count.to_f).round(1)

    # # calculates and selects restaurants that are above average
    # @restaurants.each do |restaurant|
    #   review_sum = 0
    #   restaurant.reviews.each do |review|
    #     review_sum += review.rating
    #   end

    #   if (review_sum/restaurant.reviews.length.to_f).round(1) > average
    #     @top_restaurants << restaurant
    #   end
    # end
