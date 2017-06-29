class InformationSource < ApplicationRecord
  has_many :information_source_users
  has_many :users, through: :information_source_users

  has_many :posts

  validates :rss, presence: true, uniqueness: true
  validates :logo, uniqueness: true
  # TODO сделать регулярку, для проверки ссылки
end
