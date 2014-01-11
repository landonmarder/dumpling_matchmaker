class AddUserIdToRequest < ActiveRecord::Migration
  def up
    add_column :requests, :user_id, :integer, null: false
  end

  def down
    remove_column :requests, :user_id
  end
end
