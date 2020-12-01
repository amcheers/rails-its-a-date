class DatesController < ApplicationController
  def show
    @date = Date.find(params[:id])
  end

  def new
    @date = Dateactivity.new
  end

  def create
    @date = Dateactivity.new(date_params)
    @date.user = current_user
    if @date.save
      redirect_to date_path(@date)
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

  private

  def set_date
    @date = Dateactivity.find(params[:id])
  end

  def date_params
    params.require(:date_activitie).permit(:title, :description, :price, :reservation_url, :contact_email, :availability, :location, :confirmed, :reservation)
  end
end
