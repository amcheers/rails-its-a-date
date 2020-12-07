class Package < ApplicationRecord
  has_and_belongs_to_many :date_activities
  has_many :reviews, as: :activity
  has_many :favorite_activities, as: :activity
  belongs_to :user
  attr_accessor :category

  scope :default_packages, -> { joins(:user).where(users: {email: 'test@user4.com'})}
  # Ex:- scope :active, -> {where(:active => true)}

end
