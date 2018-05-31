# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'json'

puts "deleting old data..."
[Property, Kindergarden].each(&:destroy_all)

puts "setting up static parameters"
#Property.language
languages = ["deutsch - arabisch","deutsch - englisch","deutsch - polnisch","deutsch - türkisch","deutsch - spanisch","deutsch - russisch","deutsch - französisch","deutsch - italienisch","deutsch - kurdisch","Gebärdensprache","deutsch - griechisch","deutsch - niederländisch","deutsch - portugiesisch"]

languages.each_with_index do |language, index|
  Language.create!(name: language, external_id: index)
end

#Property.topic
topics = ["Ästhetische Bildung (Musik und Kunst)","Gesundheit","Integration von Kindern mit Behinderung","Interkulturelle Pädagogik","Körper und Bewegung","Theaterpädagogik","Natur- und Umweltpädagogik","Religionspädagogik"]

topics.each_with_index do |topic, index|
  Topic.create!(name: topic, external_id: index)
end

#Property.educational
educationals = ["Montessori-Pädagogik","Natur-und Umweltpädagogik","Situationsansatz","Sonstiges","Körper und Bewegung","Naturwissenschaftliche Grunderfahrungen","bilingual (deutsch-englisch)","bilingual (deutsch-türkisch)","Gesundheit","Ästhetische Bildung (Musik und Kunst)","Integration von Kindern mit Behinderung","Interkulturelle Pädagogik","Reggio-Pädagogik","Ansatz von Emmi Pikler","Bewegung/Sport","bilingual (deutsch-russisch)","Waldorfpädagogik","Freinet-Pädagogik","bilingual (deutsch-spanisch)","Montessori","Waldorf","bilingual (polnisch)","bilingual (deutsch-französisch)","bilingual (spanisch)","bilingual (deutsch-italienisch)","bilingual (englisch)","Religionspädagogik","musikalisch/künstlerische Früherziehung","Fröbel-Pädagogik","bilingual (französisch)","bilingual (deutsch-portugiesisch)","bilingual (deutsch-griechisch)","bewegungs-/sportorientiert"]

educationals.each_with_index do |educational, index|
  Educational.create!(name: educational, external_id: index)
end

#type
categories = ["Kindertagesstätte","Eltern-Initiativ-Kindertagesstätte","Waldkindergarten","Eltern-Kind-Gruppe"]

categories.each do |category|
  Category.create!(name: category)
end

#parent_type
carriers = ["Eigenbetrieb","Sonstiger freier Träger","EKT","Arbeiterwohlfahrt","Diakonisches Werk","Deutscher Caritasverband","n.v.","","private Kita ohne Abschluss der Rahmenvereinbarung","Betriebskita","Humboldt Universität zu Berlin"]

carriers.each do |carrier|
  Carrier.create!(name: carrier)
end

#parsing the kita-table
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'db/kitas.csv'

i = 0

puts "creates new seeds...."

CSV.foreach(filepath, csv_options) do |row|
  next if i > 200
  i += 1
  puts i if i % 100 == 0
  kita = Kindergarden.new()
  kita.lat = row[1]
  kita.long = row[2]
  kita.address = row[3]
  kita.district = row[4]
  kita.plz = row[5]
  kita.properties << Educational.where(external_id: row[6].split('|').map(&:to_i))
  kita.properties << Topic.where(external_id: row[7].split('|').map(&:to_i))
  kita.properties << Language.where(external_id: row[8].split('|').map(&:to_i))
  kita.name = row[9]
  kita.category = Category.find_by(name: categories[row[10].to_i])
  kita.carrier = Carrier.find_by(name: carriers[row[11].to_i])
  kita.mo_o = row[13]
  kita.mo_c = row[14]
  kita.tu_o = row[15]
  kita.tu_c = row[16]
  kita.we_o = row[17]
  kita.we_c = row[18]
  kita.th_o = row[19]
  kita.th_c = row[20]
  kita.fr_o = row[21]
  kita.fr_c = row[22]
  kita.children_below_three = row[25]
  kita.children_above_three = row[24]
  kita.external_id = row[0]

  # getting data from the individual tables
  # filepath = "db/individual_kita_data/#{row[0]}_kitas.json"
  filepath = "db/individual_kita_data/#{kita.external_id}_kitas.json"

  if File.exists?(filepath)
    serialized_data = File.read(filepath)
    data = JSON.parse(serialized_data)
    kita.email = data["email"]
    kita.phone = data["phone"]
    kita.weblink = data["weblink"]
  end

  kita.save!

  # kita_prop = KitaProperty.new(kita.id)
  # kita_prop.property_id =
end

puts "pups!"


