class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :name, format: {with: /\A[a-zA-Z0-9_]+\z/}
  validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :email, :name, uniqueness: true
end
