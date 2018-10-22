class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    change_column_null :users, :email, true
  end
end
