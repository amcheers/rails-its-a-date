class DashboardController < ApplicationController
  def show
    @user = current_user
    @packages = Package.all
  end
end
