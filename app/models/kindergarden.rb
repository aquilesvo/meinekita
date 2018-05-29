class Kindergarden < ApplicationRecord
  belongs_to :carriers
  belongs_to :categories

  has_many :inquiries
  has_many :users, :through => :inquiries

  has_many :bookmarks
  has_many :users, :through => :bookmarks

  has many :kita_properties
  has many :properties, :through => :kita_properties

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
