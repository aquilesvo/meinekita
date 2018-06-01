class Kindergarden < ApplicationRecord
  belongs_to :carrier, required: false
  belongs_to :category, required: false

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

  def self.search(options = {})
    search = where.not(latitude: nil, longitude: nil).includes(:properties)

    if options[:categories].present?
      search = search.where(category_id: options[:categories])
    end

    if options[:carriers].present?
      search = search.where(carrier_id: options[:carriers])
    end

      # puts "now the options"
      # puts options[:properties].inspect
      # puts options[:languages].inspect + "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      # puts options[:topics].inspect + "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
      # puts options[:educationals].inspect + "CCCCCCCCCCCCCCCCCCCCCCCCCC"
      # puts options[:properties].inspect + "DDDDDDDDDDDDDDDDDDDDDDDDD"
      # puts "now the kiga.prop_ids"
      # puts kindergarden.property_ids.map(&:to_s).inspect
    search = search.all.to_a

    search.select! do |kindergarden|
      kindergarden.property_ids.map(&:to_s) & options[:properties] == options[:properties]
    end if options[:properties].present?
    # search.select! do |kindergarden|
    #   kindergarden.property_ids.map(&:to_s) & options[:topics] == options[:topics]
    # end if options[:topics].present?

    # search.select! do |kindergarden|
    #   kindergarden.property_ids.map(&:to_s) & options[:educationals] == options[:educationals]
    # end if options[:educationals].present?


    search
  end

end
