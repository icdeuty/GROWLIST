class RemoveImgFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :img, :string
  end
end
