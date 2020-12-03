class DateActivity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :packages
  has_many :reviews, as: :activity
  has_many :wishlists, as: :activity
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :availability, presence: true

  validates :reservation_url, presence: true, if: :reservation
  validates :contact_email, presence: true, if: :reservation

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:title, :description, :location],
  using: {
    tsearch: { prefix: true }
  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
