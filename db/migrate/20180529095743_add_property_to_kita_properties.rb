class AddPropertyToKitaProperties < ActiveRecord::Migration[5.2]
  def change
     add_reference :kita_properties, :property, foreign_key: true
  end
end
