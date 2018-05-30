class Kindergarden < ApplicationRecord
  belongs_to :carrier, required: false
  belongs_to :category, required: false

  has_many :inquiries
  has_many :users, :through => :inquiries

  has_many :bookmarks
  has_many :users, :through => :bookmarks


  has_many :kita_properties, dependent: :destroy
  has_many :properties, :through => :kita_properties

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
