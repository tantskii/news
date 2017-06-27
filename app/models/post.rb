class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 255}
  validates :link, presence: true
  validates :description, presence: true, length: {maximum: 255}
  validates :pub_date, presence: true
  validates :photo, presence: true
end
