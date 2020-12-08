class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :wishlists
  # The below relation is for Users that are offering dates and have uploaded them
  has_many :date_activities
  has_one_attached :photo

  # for all users


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver!
  end
end
