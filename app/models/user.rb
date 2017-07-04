require 'open-uri'
require 'simple-rss'

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

    get_posts

    if has_interests?
      posts.each do |post|
        added = false
        item  = -1

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
    else
      news_list = posts.to_a
    end

    sort_by_date(news_list)
  end

  def get_posts
    information_sources.each do |source|
      news_from_source(source)
    end
  end

  def news_from_source(source)
    link = source.rss

    rss = SimpleRSS.parse open(link)

    # TODO Написать хороший энкодер это временная мера
    rss.items.each do |result|
      result.title             = result.title.force_encoding('utf-8') unless result.title.nil?
      result.link              = result.link.force_encoding('utf-8') unless result.link.nil?
      result.description       = result.description.force_encoding('utf-8') unless result.description.nil?
      result.media_content_url = result.media_content_url.force_encoding('utf-8') unless result.media_content_url.nil?
    end

    # А если дата не спарсится?
    rss.items.each do |result|
      hash = {title:       result.title,
              pub_date:    DateTime.parse(result.pubDate.to_s).strftime('%I:%M:%S %p %Y-%m-%d'),
              link:        result.link,
              description: result.description[0...250],
              photo:       result.media_content_url}

      if not_contain_nil?(hash)
        hash = fix_conversation_error(hash)

        hash = hash.merge({information_source: source, user: self})

        Post.create(hash) if Post.where(hash).empty?
      end
    end
  end

  def has_interests?
    !interests.empty?
  end

  def has_information_sources?
    !information_sources.empty?
  end

  def has_posts?
    !posts.empty?
  end

  def new_interest
    Interest.new
  end

  def fix_conversation_error(hash)
    new_hash = {}

    new_hash[:photo] = hash[:photo]

    hash.delete(:photo)

    hash.to_a.each do |item|
      new_hash[item[0]] = item[1].encode('UTF-8', {invalid: :replace, undef: :replace, replace: '?'})
    end

    new_hash
  end

  def not_contain_nil?(hash)
    hash.delete(:photo)

    !hash.values.include?(nil)
  end

  def sort_by_date(posts)
    posts.sort_by {|post| DateTime.parse(post.pub_date) }.reverse
  end
end
