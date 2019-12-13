class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :fee
      t.string :exp
      t.string :likes
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
