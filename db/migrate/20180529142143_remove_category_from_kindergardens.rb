class RemoveCategoryFromKindergardens < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :kindergardens, :categories
    remove_foreign_key :kindergardens, :carriers

  end
end
