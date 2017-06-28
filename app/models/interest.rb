class Interest < ApplicationRecord
  has_many :interest_users
  has_many :users, through: :interest_users

  validates :word, presence: true, length: {maximum: 35}, uniqueness: true
end
