class Umbrella < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  geocoded_by :address_1
  after_validation :geocode
end