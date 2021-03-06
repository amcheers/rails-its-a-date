class PackagesController < ApplicationController
  def index
    @packages = Package.default_packages
  end

  def show
    @package = Package.find(params[:id])

    @markers = @package.date_activities.geocoded.map do |date|
      {
        lat: date.latitude,
        lng: date.longitude,
        infoWindow: render_to_string(partial: "./dates/info_window", locals: { date: date })
      }
    end
    @markers.reject! { |marker| marker[:lat].nil? || marker[:lng].nil? }
  end

  def new
    @categories = Category.all
    @package = Package.new

  end

  def create
    @package = Package.new(package_params)
    @package.user = current_user
    chosen_categories = params[:package][:category]
    chosen_categories.each do |category_id|
      if Category.find(category_id).date_activities.any?
        @package.date_activities << Category.find(category_id).date_activities.sample
      end
    end
    @package.save
    redirect_to edit_package_path(@package)
  end

  def edit
    @dates = DateActivity.all
    @package = Package.find(params[:id])
    @markers = @package.date_activities.geocoded.map do |date|
      {
        lat: date.latitude,
        lng: date.longitude,
        infoWindow: render_to_string(partial: "dates/info_window", locals: { date: date })
      }
    end
    @markers.reject! { |marker| marker[:lat].nil? || marker[:lng].nil? }
  end

  def update
    @package = Package.find(params[:id])
    @package_copy = @package.dup
    @package_copy.date_activity_ids = params[:package][:date_activity_ids]
    @package_copy.user = current_user
    @package_copy.save
    if @package_copy.user == @package.user
      @package.destroy
    end
    redirect_to package_path(@package_copy)
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
