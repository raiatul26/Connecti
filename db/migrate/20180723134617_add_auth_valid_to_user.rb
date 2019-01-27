class AddAuthValidToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :auth_valid, :boolean, :default => false
  end
end
