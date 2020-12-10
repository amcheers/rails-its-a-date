class DashboardController < ApplicationController
  def show
    @user = current_user
    @all_owned = current_user.date_activities
    @liked_dates = current_user.favorite_activities.where(activity_type: "DateActivity")
    @liked_packages = current_user.favorite_activities.where(activity_type: "Package")
  end
end
