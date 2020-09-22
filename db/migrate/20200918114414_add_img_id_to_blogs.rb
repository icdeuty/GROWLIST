class AddImgIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :img_id, :string
  end
end
