class AddCarrierToKindergardens < ActiveRecord::Migration[5.2]
  def change
    add_reference :kindergardens, :carrier, foreign_key: true
  end
end
