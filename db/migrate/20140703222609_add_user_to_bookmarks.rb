class AddUserToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :user_id, :integer
    add_column :bookmarks, :topic_id, :integer

  end
end
