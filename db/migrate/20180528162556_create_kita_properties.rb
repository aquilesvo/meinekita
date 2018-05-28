class CreateKitaProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :kita_properties do |t|

      t.timestamps
    end
  end
end
