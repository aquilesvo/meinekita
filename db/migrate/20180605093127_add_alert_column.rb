class AddAlertColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :alert, :datetime
  end
end
