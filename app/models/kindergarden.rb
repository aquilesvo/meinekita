class Kindergarden < ApplicationRecord
  belongs_to :carrier, required: false
  belongs_to :category, required: false
  belongs_to :district, required: false

  has_many :inquiries, dependent: :destroy
  has_many :users, :through => :inquiries

  has_many :bookmarks, dependent: :destroy
  has_many :users, :through => :bookmarks

  has_many :kita_properties, dependent: :destroy
  has_many :properties, :through => :kita_properties

  geocoded_by :address
  if :latitude == nil && :longitude == nil
    after_validation :geocode, if: :will_save_change_to_address?
  end

  # def self.districts
  #   uniques = self.select(:district).distinct
  #   districts = uniques.map { |d| d.district }
  #   districts.each { |d| d.downcase }
  #   districts = districts.sort!.each { |d| d.capitalize! }
  # end

  def self.search(options = {})
    search = where.not(latitude: nil, longitude: nil).includes(:properties)

    if options[:categories].present?
      search = search.where(category_id: options[:categories])
    end

    if options[:carriers].present?
      search = search.where(carrier_id: options[:carriers])
    end

    if options[:districts].present?
      search = search.where(district_id: options[:districts])
    end

    if options[:children_below_three].present?
      search = search.where(:children_below_three >= 1)
    end

    search = search.all.to_a

    search.select! do |kindergarden|
      kindergarden.property_ids.map(&:to_s) & options[:properties] == options[:properties]
    end if options[:properties].present?

    search
  end

end
