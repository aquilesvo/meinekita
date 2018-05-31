class UpdateBookmarksTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :kindergarden_id
    remove_column :bookmarks, :user_id

    # remove_foreign_key :bookmarks, :kindergardens
    # remove_foreign_key :bookmarks, :users

    add_reference :bookmarks, :kindergarden, foreign_key: true
    add_reference :bookmarks, :user, foreign_key: true
  end
end
