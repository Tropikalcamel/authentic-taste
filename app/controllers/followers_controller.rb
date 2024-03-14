class FollowersController < ApplicationController
  before_action :authenticate_user! # Add any authentication method you are using



  def create
    taster_id = params[:user_id]
    user_id = current_user.id

    if user_id != taster_id.to_i && !current_user.following?(taster_id)
      Follower.create(user_id: user_id, taster_id: taster_id)
      redirect_to taster_follow_path(taster_id), notice: 'You are now following this user.'
    else
      redirect_to taster_follow_path(taster_id), alert: 'Unable to follow this user.'
    end
  end
end




# follower_params = { user_id: current_user.id , taster_id:params[:user_id]}
# @follower = Follower.new(follower_params)
#   if @follower.save
