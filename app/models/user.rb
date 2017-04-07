class User < ApplicationRecord
  validates :nickname, presence: true
  has_many :messages, dependent: :destroy
  has_many :owned_umbrellas, class_name: :Umbrella, foreign_key: :owner_id, inverse_of: :owner, dependent: :destroy
  has_many :shared_umbrellas, inverse_of: :guest, class_name: :Umbrella, foreign_key: :guest_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
