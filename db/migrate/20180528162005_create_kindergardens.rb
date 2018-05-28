class CreateKindergardens < ActiveRecord::Migration[5.2]
  def change
    create_table :kindergardens do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :email
      t.integer :children_below_three
      t.integer :children_above_three
      t.integer :min_age_months
      t.time :opening_hour
      t.time :closing_hour

      t.timestamps
    end
  end
end
