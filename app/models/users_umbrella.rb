class UsersUmbrella < ApplicationRecord
  belongs_to :user
  belongs_to :umbrella
end
