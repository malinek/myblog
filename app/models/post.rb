class Post < ApplicationRecord
  validates :title, presence:true
  has_many :comments, dependent: :destroy
  acts_as_taggable
  has_attached_file :image, styles: { large: "900x675>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search_term)
    if Rails.env.production?
      Post.where("title ilike ?", "%#{search_term}%")
    else
      Post.where("title LIKE ?", "%#{search_term}%")
    end
  end

end
