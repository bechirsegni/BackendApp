class AddIngredientsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :ingredients, :text
  end
end
