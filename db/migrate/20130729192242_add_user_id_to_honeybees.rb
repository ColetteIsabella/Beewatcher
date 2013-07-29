class AddUserIdToHoneybees < ActiveRecord::Migration
  def change
    add_column :honeybees, :users, :user_id, :integer
  end
end
