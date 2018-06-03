class UpdateKindergardens < ActiveRecord::Migration[5.2]
  def change
    remove_column :kindergardens, :district
  end
end
