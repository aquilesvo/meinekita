class RemoveAlertColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiries, :alert
  end
end
