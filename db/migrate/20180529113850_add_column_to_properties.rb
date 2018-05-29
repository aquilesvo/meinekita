class AddColumnToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :external_id, :integer
  end
end
