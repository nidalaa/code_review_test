class ChangeStringsToIntegersinDoctors < ActiveRecord::Migration[6.0]
  def change
    change_column :doctors, :fee, :integer, using: 'fee::integer'
    change_column :doctors, :exp, :integer, using: 'exp::integer'
    change_column :doctors, :likes, :integer, using: 'likes::integer'
  end
end
