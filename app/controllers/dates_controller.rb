class DatesController < ApplicationController
  def show
    @date = Date.find(params[:id])
  end
end
