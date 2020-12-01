class DatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_date, only: [:show, :edit, :update, :destroy]

  def index
    @dates = DateActivity.all
  end
  

  def show
  end

  def destroy
    set_date.destroy
    redirect_to dashboard_dates_path
  end
  
end
