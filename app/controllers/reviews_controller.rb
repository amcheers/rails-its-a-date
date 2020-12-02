class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    activity_class = params[:activity_type].camelcase.constantize
    @activity = activity_class.find(params[:activity_id])
    @reviews = Review.all
  end
end
