class AddKindergardenToKitaProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :kita_properties, :kindergarden, foreign_key: true
  end
end
