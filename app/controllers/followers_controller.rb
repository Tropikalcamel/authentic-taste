class FollowersController < ApplicationController

  def create
      @follower = Follower.new
      @follower.user = current_user
      @follower.taster_id = @follower
        if @follower.save
        redirect_to taster_follow_path
        # needs to go confiramtion page
      else
        render "bookmark/new", status: :unprocessable_entity
      end
  end
end



# follower_params = { user_id: current_user.id , taster_id:params[:user_id]}
# @follower = Follower.new(follower_params)
#   if @follower.save
