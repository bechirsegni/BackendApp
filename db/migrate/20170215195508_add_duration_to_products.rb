class AddDurationToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :duration, :string
  end
end
