class Kindergarden < ApplicationRecord
  belongs_to :carrier, required: false
  belongs_to :category, required: false

  has_many :inquiries
  has_many :users, :through => :inquiries

  has_many :bookmarks
  has_many :users, :through => :bookmarks

  has_many :kita_properties
  has_many :properties, :through => :kita_properties
end
