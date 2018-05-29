# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

languages = ["deutsch - arabisch","deutsch - englisch","deutsch - polnisch","deutsch - türkisch","deutsch - spanisch","deutsch - russisch","deutsch - französisch","deutsch - italienisch","deutsch - kurdisch","Gebärdensprache","deutsch - griechisch","deutsch - niederländisch","deutsch - portugiesisch"]

languages.each do |language|
  Language.create!(name: language)
end

topics

educationals = ["Montessori-Pädagogik","Natur-und Umweltpädagogik","Situationsansatz","Sonstiges","Körper und Bewegung","Naturwissenschaftliche Grunderfahrungen","bilingual (deutsch-englisch)","bilingual (deutsch-türkisch)","Gesundheit","Ästhetische Bildung (Musik und Kunst)","Integration von Kindern mit Behinderung","Interkulturelle Pädagogik","Reggio-Pädagogik","Ansatz von Emmi Pikler","Bewegung/Sport","bilingual (deutsch-russisch)","Waldorfpädagogik","Freinet-Pädagogik","bilingual (deutsch-spanisch)","Montessori","Waldorf","bilingual (polnisch)","bilingual (deutsch-französisch)","bilingual (spanisch)","bilingual (deutsch-italienisch)","bilingual (englisch)","Religionspädagogik","musikalisch/künstlerische Früherziehung","Fröbel-Pädagogik","bilingual (französisch)","bilingual (deutsch-portugiesisch)","bilingual (deutsch-griechisch)","bewegungs-/sportorientiert"]

educationals.each do |educational|
  Educational.create!(name: language)
end

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath = 'kitas.csv'

# CSV.foreach(filepath) do |row|
#   languages = Property.new()


# end

# CSV.foreach(filepath, csv_options) do |row|
#   # Here, row is an array of columns
#   puts "#{row[]} | #{row[1]} | #{row[2]}"

  # "id","alat","alon","address","district","plz","educational","topics","languages","name","type","parent","parentType","mo_o","mo_c","tu_o","tu_c","we_o","we_c","th_o","th_c","fr_o","fr_c","all","over","under"

#   Kita.new( )



#   kita.save

#   Focus.find_by(fid: )
#   KitaFocus.new(kita_id: kita.id, focus_id: )
# end


# require 'json'

# filepath = 'kita-explorer/data-cleaning/data/kitas_dict.json'

# serialized_kita_ = File.read(filepath)

# data_id_translation = JSON.parse(serialized_beers)
