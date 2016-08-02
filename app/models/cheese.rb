class Cheese < ApplicationRecord
  belongs_to :user
  has_many :user_cheese

  validates :name, presence: true, uniqueness: true
end
