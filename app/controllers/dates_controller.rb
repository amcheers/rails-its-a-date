class DatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_date, only: [:show, :edit, :update, :destroy]

  def index
    search
    @categories = Category.all
  end

  def show
  end

  def new
    @date = DateActivity.new
  end

  def create
    @date = DateActivity.new(date_params)
    @date.user = current_user
    if @date.save
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
    # @filtered_dates = []
    @dates = DateActivity.all

     if params[:query_location].present?
      @dates = @dates.global_search(params[:query_location])
    end

    if params[:query_title_description].present?
      @dates = @dates.global_search(params[:query_title_description])
    end

    if params[:query_price].present?
      @dates = @dates.where("price <= ?", params[:query_price])
    end

    if params[:category_ids].present?
      @dates = @dates.joins(:categories).where(categories: { id: params[:category_ids] })
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
