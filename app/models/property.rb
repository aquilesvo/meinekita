class Property < ApplicationRecord

  has_many :kita_properties, dependent: :destroy
  has_many :kindergardens, :through => :kita_properties

end
