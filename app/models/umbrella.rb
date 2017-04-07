class Umbrella < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users_umbrella
  has_many :users, dependent: :destroy, through: :users_umbrella
  geocoded_by :address_1
  after_validation :geocode
end
