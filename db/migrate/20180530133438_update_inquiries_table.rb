class UpdateInquiriesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiries, :kindergarden_id
    remove_column :inquiries, :user_id

    # remove_foreign_key :inquiries, :kindergardens
    # remove_foreign_key :inquiries, :users

    add_reference :inquiries, :kindergarden, foreign_key: true
    add_reference :inquiries, :user, foreign_key: true
  end
end
