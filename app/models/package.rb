class Package < ApplicationRecord
  has_and_belongs_to_many :date_activities
end