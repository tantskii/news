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

  def made_news_list
    news_list = []

    posts.each do |post|
      added = false
      item = -1

      post_string = (post.title + ' ' + post.description).downcase

      puts interests.size

      while !added && item != interests.size - 1
        item += 1

        puts item.to_s + ' ' + post.title

        if !post_string.scan(interests[item].word).empty?
          news_list << post
          added = true
        end
      end
    end

    news_list
  end

  def has_interests?
    !interests.empty?
  end
end
