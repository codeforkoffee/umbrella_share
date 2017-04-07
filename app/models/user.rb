class User < ApplicationRecord
  validates :nickname, presence: true
  has_many :messages, dependent: :destroy
  has_many :users_umbrella
  has_many :umbrellas, dependent: :destroy, through: :users_umbrella

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
