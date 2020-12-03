class Package < ApplicationRecord
  has_and_belongs_to_many :date_activities
  has_many :reviews, as: :activity
  has_many :wishlists, as: :activity
  belongs_to :user

end
