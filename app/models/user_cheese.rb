class UserCheese < ApplicationRecord
  belongs_to :user
  belongs_to :cheese

  validates :user_id, presence: true
  validates :cheese_id, presence: true
end
