class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :properties, :kind, :type
  end
end
