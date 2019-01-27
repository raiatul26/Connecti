class DropFriendshipsTable < ActiveRecord::Migration[5.2]
  def change
  end
  def up
    drop_table :friendships
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
