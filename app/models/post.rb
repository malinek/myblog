class Post < ApplicationRecord
  validates :title, presence:true
  has_many :comments
  acts_as_taggable

  def self.search(search_term)
    if Rails.env.production?
      Post.where("title ilike ?", "%#{search_term}%")
    else
      Post.where("title LIKE ?", "%#{search_term}%")
    end
  end

end
