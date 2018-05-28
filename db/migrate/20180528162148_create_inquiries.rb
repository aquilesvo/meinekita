class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.string :content
      t.string :status

      t.timestamps
    end
  end
end
