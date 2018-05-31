class UpdateKindergardensTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :kindergardens, :lat
    remove_column :kindergardens, :long
  end
end
