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
    @romantic_id = Category.find_by(name: "romantic").id
    @educational_id = Category.find_by(name: "educational").id
    @dinner_id = Category.find_by(name: "dinner").id
    @active_id = Category.find_by(name: "active").id
    @drinks_id = Category.find_by(name: "drinks").id
  end
end
