class AddImageToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :image, :string
  end
end
