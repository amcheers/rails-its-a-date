class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :wishlists
  has_one_attached :photo

  # for all users
  validates :username, presence: true, uniqueness: true

  # only for users that are creating new activities (offering: true)
  validates :first_name, presence: true, if: :offering
  validates :last_name, presence: true, if: :offering
  validates :address, presence: true, if: :offering
end
