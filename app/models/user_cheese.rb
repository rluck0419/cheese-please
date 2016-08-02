class UserCheese < ApplicationRecord
  belongs_to :user
  belongs_to :cheese
end
