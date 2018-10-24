class AddFacebookDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :link, :string
    add_column :users, :image, :string
  end
end
