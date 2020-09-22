class ChangeNameOptionsToUsers < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :name, :string, null: false, default: ""
  end

  def down
  	change_column :users, :name, :string
  end
end
