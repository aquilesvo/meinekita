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
  if :latitude != nil && :longitude != nil
    after_validation :geocode, if: :will_save_change_to_address?
  end

  def self.search(options = {})
    search = where.not(lat: nil, long: nil)

    if options[:categories].present?
      search = search.where(category_id: options[:categories])
    end

    search.all
  end

end
