class FavoriteActivitiesController < ApplicationController
  before_action :set_activity
  before_action :set_user, only: [:like_unlike, :create]

  def like_unlike
    @fav_activity = FavoriteActivity.find_by(user_id: @user_id, activity: @activity)
    if @fav_activity
      @fav_activity.destroy
    else
      @fav_activity = FavoriteActivity.create(user_id: @user_id, activity: @activity)
    end
  end

  def create
    @fav_activity = FavoriteActivity.find_or_create_by(user_id: @user_id, activity: @activity)
    respond_to do |format|
      if @fav_activity.save!
        format.html
        format.js
      else
        format.html
      end
    end
  end

  def destroy
    @fav_activity.destroy
  end

  private

  def set_activity
    activity_class = params[:activity_type].camelcase.constantize
    @activity = activity_class.find(params[:activity_id])
  end

  def set_user
    @user_id = current_user.id
  end
end
