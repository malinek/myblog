class AddSubtitleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :subtitle, :text
  end
end
