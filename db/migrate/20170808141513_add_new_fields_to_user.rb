class AddNewFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :pan_card_number, :string
    add_column :users, :mobile, :string
  end
end
