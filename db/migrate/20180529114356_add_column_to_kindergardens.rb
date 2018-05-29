class AddColumnToKindergardens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergardens, :lat, :float
    add_column :kindergardens, :long, :float
    add_column :kindergardens, :district, :string
    add_column :kindergardens, :plz, :integer
    add_column :kindergardens, :mo_o, :time
    add_column :kindergardens, :mo_c, :time
    add_column :kindergardens, :tu_o, :time
    add_column :kindergardens, :tu_c, :time
    add_column :kindergardens, :we_o, :time
    add_column :kindergardens, :we_c, :time
    add_column :kindergardens, :th_o, :time
    add_column :kindergardens, :th_c, :time
    add_column :kindergardens, :fr_o, :time
    add_column :kindergardens, :fr_c, :time
    remove_column :kindergardens, :opening_hour, :time
    remove_column :kindergardens, :closing_hour, :time
  end
end
