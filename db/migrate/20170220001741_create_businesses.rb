class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :postal
      t.string :email
      t.string :phone
      t.string :twitter
      t.string :facebook
      t.string :website

      t.timestamps
    end
  end
end
