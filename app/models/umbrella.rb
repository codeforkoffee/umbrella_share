class Umbrella < ApplicationRecord
  has_and_belongs_to_many :users

  geocoded_by :address_1
  after_validation :geocode
end