class DashboardController < ApplicationController
  def show
    @user = current_user
    @my_packages = Package.where(user_id: current_user.id)
    @owned_dates = DateActivity.where(user_id: current_user.id)
    @liked_dates = current_user.favorite_activities.where(activity_type: "DateActivity")
    @liked_packages = current_user.favorite_activities.where(activity_type: "Package")
  end
end
