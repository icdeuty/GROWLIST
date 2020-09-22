class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.text :feature
      t.integer :postal_code
      t.string :address
      t.integer :phone_number
      t.text :point
      t.string :img_id

      t.timestamps
    end
  end
end
