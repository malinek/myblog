class Post < ApplicationRecord
  validates :title, presence:true
  has_many :comments
  acts_as_taggable

  def self.search(search_term)
    like_string = Rails.env.production? ? "ilike" : "LIKE"
    Post.where("title LIKE ?", "%#{search_term}%")
  end

end
