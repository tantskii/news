class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  validates :name, presence: true, length: {maximum: 35}
  validates :name, format: {with: /\A[a-zA-Z0-9_]+\z/}
end
