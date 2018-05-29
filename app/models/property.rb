class Property < ApplicationRecord
  has_many :kita_properties
  has_many :kindergardens, :through => :kita_properties
end
