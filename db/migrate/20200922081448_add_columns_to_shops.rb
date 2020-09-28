class AddColumnsToShops < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :prefecture_code, :integer
  	add_column :shops, :address_city, :string
  end
end
