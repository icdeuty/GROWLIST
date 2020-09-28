class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :address_building, :string

  	remove_column :shops, :address, :string
  end
end
