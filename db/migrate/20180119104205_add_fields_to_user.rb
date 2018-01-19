class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :status, :integer
    add_column :users, :active, :boolean
  end
end
