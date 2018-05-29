class AddKindergardenToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_reference :inquiries, :kindergarden, foreign_key: true
  end
end
