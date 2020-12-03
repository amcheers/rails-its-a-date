class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    @package_copy = @package.dup
    @package_copy.date_activity_ids = params[:package][:date_activity_ids]
    @package_copy.user = current_user
    @package_copy.save
    @package_copy.update(package_params)
    redirect_to dashboard_path
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to dashboard_path
  end

  private

  def package_params
    params.require(:package).permit(:title)
  end
end
