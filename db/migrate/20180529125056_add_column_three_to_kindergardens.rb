class AddColumnThreeToKindergardens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergardens, :weblink, :string
  end
end
