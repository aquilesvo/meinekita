class AddAlertsToInqueries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :alert, :boolean, :default => false
  end
end
