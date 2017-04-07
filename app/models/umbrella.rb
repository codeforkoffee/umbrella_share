class Umbrella < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :owner, class_name: :User, inverse_of: :owned_umbrellas
  belongs_to :guest, class_name: :User, optional: true, inverse_of: :shared_umbrellas

  geocoded_by :address_1
  after_validation :geocode
end
