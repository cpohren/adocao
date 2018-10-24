class AddCityToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :city, :string
  end
end
