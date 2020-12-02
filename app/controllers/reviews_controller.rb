class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_activity

  def index
    @reviews = @activity.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.activity = @activity
    if @review.save
      redirect_to reviews_path(@activity)
    else
      :new
    end
  end

  private

  def set_activity
    activity_class = params[:activity_type].camelcase.constantize
    @activity = activity_class.find(params[:activity_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
