class DateActivity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :packages
  has_many :reviews, as: :activity
  has_many :wishlists, as: :activity
end
