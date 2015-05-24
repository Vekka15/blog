class RemoveUsernameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :Username
  end
end
