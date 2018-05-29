class ChangeColumFourToKindergardens < ActiveRecord::Migration[5.2]
  def change
    change_column :kindergardens, :phone, :string
  end
end
