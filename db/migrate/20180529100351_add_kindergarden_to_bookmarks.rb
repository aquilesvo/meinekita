class AddKindergardenToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookmarks, :kindergarden, foreign_key: true
  end
end
