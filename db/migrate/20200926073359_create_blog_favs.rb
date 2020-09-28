class CreateBlogFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_favs do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
