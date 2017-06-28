class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :interest_users
  has_many :interests, through: :interest_users

  has_many :information_source_users
  has_many :information_sources, through: :information_source_users

  validates :name, presence: true, length: {maximum: 35}
  validates :name, format: {with: /\A[a-zA-Z0-9_]+\z/}
end
