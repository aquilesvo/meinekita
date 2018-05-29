# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'json'

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
  Educational.create!(name: language, external_id: index)
end

#type
categories = ["Kindertagesstätte","Eltern-Initiativ-Kindertagesstätte","Waldkindergarten","Eltern-Kind-Gruppe"]

categories.each do |category|
  Category.create!(name: category)
end

#parent_type
carriers = ["(Eigenbetrieb)","(Sonstiger freier Träger)","(EKT)","(Arbeiterwohlfahrt)","(Diakonisches Werk)","(Deutscher Caritasverband)","(n.v.)","","(private Kita ohne Abschluss der Rahmenvereinbarung)","(Betriebskita)","(Humboldt Universität zu Berlin)"]

carriers.each do |carrier|
  Carrier.create!(name: carrier)
end

#parsing the kita-table
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'kitas.csv'

CSV.foreach(filepath, csv_options) do |row|

  kita = Kindergarden.new()
  kita.lat = row[1]
  kita.long = row[2]
  kita.address = row[3]
  kita.district = row[4]
  kita.plz = row[5]
  kita.property.educational = Poperty.find_by(external_id: row[6])
  kita.property.topics = Poperty.find_by(external_id: row[7])
  kita.property.languages = Property.find_by(external_id: row[8])
  kita.name = row[9]
  kita.category_id = categories[row[10]]
  kita.carrier = carriers[row[11]]
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
  filepath = 'individual kita-data/#{kita.external_id}'
  serialized_data = File.read(filepath)
  data = JSON.parse(serialized_data)
  kita.email = data[:email]
  kita.phone = data[:phone]
  kita.weblink = data[:weblink]

  kita.save
end


