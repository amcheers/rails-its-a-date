class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @dates = DateActivity.all
    direct_category_search
    @categories = Category.all
    @reviews = Review.take(3)
  end

  def direct_category_search
    @outdoor_id = Category.find_by(name: "outdoor").id
    # @outdoor_dates = DateActivity.all.joins(:categories).where(categories: @outdoor)

    # @romantic = Category.where(name: "romantic")
    # @educational = Category.where(name: "educational")
    # @dinner = Category.where(name: "dinner")
    # @active = Category.where(name: "active")
    # @drinks = Category.where(name: "drinks")
  end
end
