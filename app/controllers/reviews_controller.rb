class ReviewsController < ApplicationController

  def index
    @reviews = Reviews.all
  end
end
