class AddDistrictToKindergardens < ActiveRecord::Migration[5.2]
  def change
    add_reference :kindergardens, :district, foreign_key: true
  end
end
