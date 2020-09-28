class AddUserIdToShops < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :user_id, :string
  end
end
