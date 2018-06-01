class AddDefautToAlert < ActiveRecord::Migration[5.2]
  def change
    change_column :inquiries, :alert, :boolean, :default => false
  end
end
