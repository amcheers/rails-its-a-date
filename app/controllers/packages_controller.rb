class PackagesController < ApplicationController

  def index
    @packages = Packages.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    @package_copy = @package.dup
    @package_copy.save
    redirect_to packages_path
  end

end
