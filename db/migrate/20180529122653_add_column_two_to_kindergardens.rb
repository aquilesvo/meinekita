class AddColumnTwoToKindergardens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergardens, :external_id, :integer
  end
end
