class DatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_date, only: [:show, :edit, :update, :destroy]

  def index
    search
    @categories = Category.all
    @dates = DateActivity.all.paginate(page: params[:page], per_page: 10)
    @markers = @dates.geocoded.map do |date|
      {
        lat: date.latitude,
        lng: date.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { date: date })
      }
    end
    @markers.reject! { |marker| marker[:lat].nil? || marker[:lng].nil? }
  end

  def show
    @marker = [{ lat: @date.latitude, lng: @date.longitude }]
  end

  def new
    @date = DateActivity.new
  end

  def create
    @date = DateActivity.new(date_params)
    @date.user = current_user
    if @date.save
      UserMailer.with(user: @date.user).create.deliver_now
      UserMailer.developer.deliver_now
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @date.update(date_params)
    redirect_to dashboard_path
  end

  def destroy
    set_date.destroy
    redirect_to dashboard_dates_path
  end

  def search
    @dates = DateActivity.all

    if params.dig(:search, "query_location")
      @dates = @dates.global_search(params.dig(:search, "query_location"))
    end

    if params.dig(:search, "query_title_description")
      @dates = @dates.global_search(params.dig(:search, "query_title_description"))
    end

    if params.dig(:search, "price") && !params.dig(:search, "price").empty?
      @dates = @dates.where("price <= ?", params.dig(:search, "price"))
    end

    if params.dig(:search, "category_id") && !params.dig(:search, "category_id").any?
      @dates = @dates.joins(:categories).where(categories: { id: params.dig(:search, "category_id") })
    end

    if params.dig(:search, "date") && !params.dig(:search, "date").empty?
      weekday = Date.parse(params.dig(:search, "date")).strftime("%A")
      @dates = @dates.where("availability->>? != 'closed'", weekday)
    end
  end

  private

  def set_date
    @date = DateActivity.find(params[:id])
  end

  def date_params
    params.require(:date_activity).permit(:title, :description, :price, :reservation_url, :contact_email, :availability, :location, :confirmed, :reservation, :user_id, :photo)
  end
end
