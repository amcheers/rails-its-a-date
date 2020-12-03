class DashboardController < ApplicationController
  def show
    @packages = Package.all
  end
end
