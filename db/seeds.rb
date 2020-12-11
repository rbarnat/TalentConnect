require 'faker'
require 'activerecord-reset-pk-sequence'
Faker::Config.locale = 'fr'

ActiveRecord::Base.connection.disable_referential_integrity do
  Review.delete_all
  Review.reset_pk_sequence
  JoinTableTalentCategory.delete_all
  JoinTableTalentCategory.reset_pk_sequence
  Category.delete_all
  Category.reset_pk_sequence
  Message.delete_all
  Message.reset_pk_sequence
  Appointment.delete_all
  Appointment.reset_pk_sequence
  Talent.delete_all
  Talent.reset_pk_sequence
  User.delete_all
  User.reset_pk_sequence
  Place.delete_all
  Place.reset_pk_sequence
  puts 'DB cleaned up !'
end


# --- PLACES ---

# PARIS
paris_addresses = 
[
  #Paris 1st district
  {:city_name => "Paris", :zip_code => "75001", :address => "11 rue d'Alger", :latitude => 48.865572,:longitude => 2.329904},
  {:city_name => "Paris", :zip_code => "75001", :address => "8 rue de l'Amiral de Coligny", :latitude => 48.86067,:longitude => 2.340928},
  {:city_name => "Paris", :zip_code => "75001", :address => "2 place André Malraux", :latitude => 48.863963,:longitude => 2.335737},
  {:city_name => "Paris", :zip_code => "75001", :address => "15 rue de l'Arbre Sec", :latitude => 48.859682,:longitude => 2.341897},
  {:city_name => "Paris", :zip_code => "75001", :address => "25B rue d'Argenteuil", :latitude => 48.866215,:longitude => 2.333242},
  #Paris 2nd district
  {:city_name => "Paris", :zip_code => "75002", :address => "50 rue Dalayrac", :latitude => 48.868181,:longitude => 2.335286},
  {:city_name => "Paris", :zip_code => "75002", :address => "20 rue Danielle Casanova", :latitude => 48.868059,:longitude => 2.33145},
  {:city_name => "Paris", :zip_code => "75002", :address => "1 rue des Degrés", :latitude => 48.869399,:longitude => 2.350622},
  {:city_name => "Paris", :zip_code => "75002", :address => "28 rue Dussoubs", :latitude => 48.866156,:longitude => 2.349107},
  {:city_name => "Paris", :zip_code => "75002", :address => "14 rue Étienne Marcel", :latitude => 48.864006,:longitude => 2.348835},

  #Paris 3rd district
  {:city_name => "Paris", :zip_code => "75003", :address => "2 rue Blondel", :latitude => 48.868496,:longitude => 2.355043},
  {:city_name => "Paris", :zip_code => "75003", :address => "9,Rue du Bourg l'Abbé", :latitude => 48.864018,:longitude => 2.351698},
  {:city_name => "Paris", :zip_code => "75003", :address => "13,Rue de Braque", :latitude => 48.861192,:longitude => 2.356174},
  {:city_name => "Paris", :zip_code => "75003", :address => "47B,Rue de Bretagne", :latitude => 48.863346,:longitude => 2.361409},
  {:city_name => "Paris", :zip_code => "75003", :address => "49,Rue Charlot", :latitude => 48.863264,:longitude => 2.362949},
  #Paris 4th district
  {:city_name => "Paris", :zip_code => "75004", :address => "75,Rue Saint-Antoine", :latitude => 48.854408,:longitude => 2.363073},
  {:city_name => "Paris", :zip_code => "75004", :address => "16,Rue Sainte-Croix Bretonnerie", :latitude => 48.858089,:longitude => 2.356706},
  {:city_name => "Paris", :zip_code => "75004", :address => "3,Place Saint-Gervais", :latitude => 48.855673,:longitude => 2.3543},
  {:city_name => "Paris", :zip_code => "75004", :address => "42,Rue Saint-Louis en l'Île", :latitude => 48.851714,:longitude => 2.356989},
  {:city_name => "Paris", :zip_code => "75004", :address => "120,Rue Saint-Martin", :latitude => 48.860577,:longitude => 2.351205},

  #Paris 5th district
  {:city_name => "Paris", :zip_code => "75005", :address => "36,Rue du Fer à Moulin", :latitude => 48.838906,:longitude => 2.352837},
  {:city_name => "Paris", :zip_code => "75005", :address => "8,Rue des Feuillantines", :latitude => 48.841737,:longitude => 2.3424},
  {:city_name => "Paris", :zip_code => "75005", :address => "14,Rue des Fossés Saint-Bernard", :latitude => 48.848736,:longitude => 2.355045},
  {:city_name => "Paris", :zip_code => "75005", :address => "11,Rue Frédéric Sauton", :latitude => 48.850876,:longitude => 2.349118},
  {:city_name => "Paris", :zip_code => "75005", :address => "9,Rue Fustel de Coulanges", :latitude => 48.839406,:longitude => 2.339694},

  #Paris 6th districit
  {:city_name => "Paris", :zip_code => "75006", :address => "19,Rue Mazarine", :latitude => 48.855102,:longitude => 2.337892},
  {:city_name => "Paris", :zip_code => "75006", :address => "5BIS,Rue André Mazet", :latitude => 48.853895,:longitude => 2.339174},
  {:city_name => "Paris", :zip_code => "75006", :address => "9B,Rue de Mézières", :latitude => 48.850213,:longitude => 2.331446},
  {:city_name => "Paris", :zip_code => "75006", :address => "14,Rue Monsieur le Prince", :latitude => 48.850426,:longitude => 2.339608},
  {:city_name => "Paris", :zip_code => "75006", :address => "101,Boulevard du Montparnasse", :latitude => 48.842485,:longitude => 2.328727},

  #Paris 7th district
  {:city_name => "Paris", :zip_code => "75007", :address => "53,Rue Cler", :latitude => 48.85607,:longitude => 2.306868},
  {:city_name => "Paris", :zip_code => "75007", :address => "10,Rue Cognacq Jay", :latitude => 48.861861,:longitude => 2.304083},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de la Comète", :latitude => 48.858742,:longitude => 2.309221},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de Constantine", :latitude => 48.859858,:longitude => 2.314948},
  {:city_name => "Paris", :zip_code => "75007", :address => "6,Rue Desgenettes", :latitude => 48.861811,:longitude => 2.309648},
  #Paris 8th district
  {:city_name => "Paris", :zip_code => "75008", :address => "15,Rue de la Bienfaisance", :latitude => 48.876576,:longitude => 2.317404},
  {:city_name => "Paris", :zip_code => "75008", :address => "6,Rue du Boccador", :latitude => 48.866348,:longitude => 2.303441},
  {:city_name => "Paris", :zip_code => "75008", :address => "25,Rue Boissy d'Anglas", :latitude => 48.869289,:longitude => 2.322053},
  {:city_name => "Paris", :zip_code => "75008", :address => "9,Rue de Bucarest", :latitude => 48.880633,:longitude => 2.326189},
  {:city_name => "Paris", :zip_code => "75008", :address => "104,Avenue des Champs-Élysées", :latitude => 48.872094,:longitude => 2.301611},

  #Paris 9th district
  {:city_name => "Paris", :zip_code => "75009", :address => "3,Rue Blanche", :latitude => 48.877403,:longitude => 2.332041},
  {:city_name => "Paris", :zip_code => "75009", :address => "1S,Impasse de la Boule Rouge", :latitude => 48.873569,:longitude => 2.34383},
  {:city_name => "Paris", :zip_code => "75009", :address => "38,Rue de Bruxelles", :latitude => 48.882923,:longitude => 2.328497},
  {:city_name => "Paris", :zip_code => "75009", :address => "4,Rue de Budapest", :latitude => 48.876075,:longitude => 2.32771},
  {:city_name => "Paris", :zip_code => "75009", :address => "16B,Rue Cadet", :latitude => 48.874924,:longitude => 2.343079},
  #Paris 10th district
  {:city_name => "Paris", :zip_code => "75010", :address => "4TER,Boulevard de Bonne Nouvelle", :latitude => 48.870049,:longitude => 2.352418},
  {:city_name => "Paris", :zip_code => "75010", :address => "10,Rue Bouchardon", :latitude => 48.869931,:longitude => 2.35742},
  {:city_name => "Paris", :zip_code => "75010", :address => "18S,Rue Boy-Zelenski", :latitude => 48.877508,:longitude => 2.368728},
  {:city_name => "Paris", :zip_code => "75010", :address => "78,Passage Brady", :latitude => 48.871436,:longitude => 2.354498},
  {:city_name => "Paris", :zip_code => "75010", :address => "7B,Passage du Buisson Saint-Louis", :latitude => 48.872544,:longitude => 2.372883},

  #Paris 11th district
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Rue Henri Ranvier", :latitude => 48.85861,:longitude => 2.386745},
  {:city_name => "Paris", :zip_code => "75011", :address => "3,Place Hubertine Auclert", :latitude => 48.858904,:longitude => 2.380658},
  {:city_name => "Paris", :zip_code => "75011", :address => "7,Impasse des Jardiniers", :latitude => 48.852188,:longitude => 2.392034},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Jean Macé", :latitude => 48.852814,:longitude => 2.384627},
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Passage du Jeu de Boules", :latitude => 48.865629,:longitude => 2.367579},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Saint-Maur", :latitude => 48.858878,:longitude => 2.383424},

  #----------------------
  # COPY OF WHAT IS ABOVE
  #----------------------

  #Paris 1st district
  {:city_name => "Paris", :zip_code => "75001", :address => "11 rue d'Alger", :latitude => 48.865572,:longitude => 2.329904},
  {:city_name => "Paris", :zip_code => "75001", :address => "8 rue de l'Amiral de Coligny", :latitude => 48.86067,:longitude => 2.340928},
  {:city_name => "Paris", :zip_code => "75001", :address => "2 place André Malraux", :latitude => 48.863963,:longitude => 2.335737},
  {:city_name => "Paris", :zip_code => "75001", :address => "15 rue de l'Arbre Sec", :latitude => 48.859682,:longitude => 2.341897},
  {:city_name => "Paris", :zip_code => "75001", :address => "25B rue d'Argenteuil", :latitude => 48.866215,:longitude => 2.333242},
  #Paris 2nd district
  {:city_name => "Paris", :zip_code => "75002", :address => "50 rue Dalayrac", :latitude => 48.868181,:longitude => 2.335286},
  {:city_name => "Paris", :zip_code => "75002", :address => "20 rue Danielle Casanova", :latitude => 48.868059,:longitude => 2.33145},
  {:city_name => "Paris", :zip_code => "75002", :address => "1 rue des Degrés", :latitude => 48.869399,:longitude => 2.350622},
  {:city_name => "Paris", :zip_code => "75002", :address => "28 rue Dussoubs", :latitude => 48.866156,:longitude => 2.349107},
  {:city_name => "Paris", :zip_code => "75002", :address => "14 rue Étienne Marcel", :latitude => 48.864006,:longitude => 2.348835},

  #Paris 3rd district
  {:city_name => "Paris", :zip_code => "75003", :address => "2 rue Blondel", :latitude => 48.868496,:longitude => 2.355043},
  {:city_name => "Paris", :zip_code => "75003", :address => "9,Rue du Bourg l'Abbé", :latitude => 48.864018,:longitude => 2.351698},
  {:city_name => "Paris", :zip_code => "75003", :address => "13,Rue de Braque", :latitude => 48.861192,:longitude => 2.356174},
  {:city_name => "Paris", :zip_code => "75003", :address => "47B,Rue de Bretagne", :latitude => 48.863346,:longitude => 2.361409},
  {:city_name => "Paris", :zip_code => "75003", :address => "49,Rue Charlot", :latitude => 48.863264,:longitude => 2.362949},
  #Paris 4th district
  {:city_name => "Paris", :zip_code => "75004", :address => "75,Rue Saint-Antoine", :latitude => 48.854408,:longitude => 2.363073},
  {:city_name => "Paris", :zip_code => "75004", :address => "16,Rue Sainte-Croix Bretonnerie", :latitude => 48.858089,:longitude => 2.356706},
  {:city_name => "Paris", :zip_code => "75004", :address => "3,Place Saint-Gervais", :latitude => 48.855673,:longitude => 2.3543},
  {:city_name => "Paris", :zip_code => "75004", :address => "42,Rue Saint-Louis en l'Île", :latitude => 48.851714,:longitude => 2.356989},
  {:city_name => "Paris", :zip_code => "75004", :address => "120,Rue Saint-Martin", :latitude => 48.860577,:longitude => 2.351205},

  #Paris 5th district
  {:city_name => "Paris", :zip_code => "75005", :address => "36,Rue du Fer à Moulin", :latitude => 48.838906,:longitude => 2.352837},
  {:city_name => "Paris", :zip_code => "75005", :address => "8,Rue des Feuillantines", :latitude => 48.841737,:longitude => 2.3424},
  {:city_name => "Paris", :zip_code => "75005", :address => "14,Rue des Fossés Saint-Bernard", :latitude => 48.848736,:longitude => 2.355045},
  {:city_name => "Paris", :zip_code => "75005", :address => "11,Rue Frédéric Sauton", :latitude => 48.850876,:longitude => 2.349118},
  {:city_name => "Paris", :zip_code => "75005", :address => "9,Rue Fustel de Coulanges", :latitude => 48.839406,:longitude => 2.339694},

  #Paris 6th district
  {:city_name => "Paris", :zip_code => "75006", :address => "19,Rue Mazarine", :latitude => 48.855102,:longitude => 2.337892},
  {:city_name => "Paris", :zip_code => "75006", :address => "5BIS,Rue André Mazet", :latitude => 48.853895,:longitude => 2.339174},
  {:city_name => "Paris", :zip_code => "75006", :address => "9B,Rue de Mézières", :latitude => 48.850213,:longitude => 2.331446},
  {:city_name => "Paris", :zip_code => "75006", :address => "14,Rue Monsieur le Prince", :latitude => 48.850426,:longitude => 2.339608},
  {:city_name => "Paris", :zip_code => "75006", :address => "101,Boulevard du Montparnasse", :latitude => 48.842485,:longitude => 2.328727},

  #Paris 7th district
  {:city_name => "Paris", :zip_code => "75007", :address => "53,Rue Cler", :latitude => 48.85607,:longitude => 2.306868},
  {:city_name => "Paris", :zip_code => "75007", :address => "10,Rue Cognacq Jay", :latitude => 48.861861,:longitude => 2.304083},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de la Comète", :latitude => 48.858742,:longitude => 2.309221},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de Constantine", :latitude => 48.859858,:longitude => 2.314948},
  {:city_name => "Paris", :zip_code => "75007", :address => "6,Rue Desgenettes", :latitude => 48.861811,:longitude => 2.309648},
  #Paris 8th district
  {:city_name => "Paris", :zip_code => "75008", :address => "15,Rue de la Bienfaisance", :latitude => 48.876576,:longitude => 2.317404},
  {:city_name => "Paris", :zip_code => "75008", :address => "6,Rue du Boccador", :latitude => 48.866348,:longitude => 2.303441},
  {:city_name => "Paris", :zip_code => "75008", :address => "25,Rue Boissy d'Anglas", :latitude => 48.869289,:longitude => 2.322053},
  {:city_name => "Paris", :zip_code => "75008", :address => "9,Rue de Bucarest", :latitude => 48.880633,:longitude => 2.326189},
  {:city_name => "Paris", :zip_code => "75008", :address => "104,Avenue des Champs-Élysées", :latitude => 48.872094,:longitude => 2.301611},

  #Paris 9th district
  {:city_name => "Paris", :zip_code => "75009", :address => "3,Rue Blanche", :latitude => 48.877403,:longitude => 2.332041},
  {:city_name => "Paris", :zip_code => "75009", :address => "1S,Impasse de la Boule Rouge", :latitude => 48.873569,:longitude => 2.34383},
  {:city_name => "Paris", :zip_code => "75009", :address => "38,Rue de Bruxelles", :latitude => 48.882923,:longitude => 2.328497},
  {:city_name => "Paris", :zip_code => "75009", :address => "4,Rue de Budapest", :latitude => 48.876075,:longitude => 2.32771},
  {:city_name => "Paris", :zip_code => "75009", :address => "16B,Rue Cadet", :latitude => 48.874924,:longitude => 2.343079},
  #Paris 10th district
  {:city_name => "Paris", :zip_code => "75010", :address => "4TER,Boulevard de Bonne Nouvelle", :latitude => 48.870049,:longitude => 2.352418},
  {:city_name => "Paris", :zip_code => "75010", :address => "10,Rue Bouchardon", :latitude => 48.869931,:longitude => 2.35742},
  {:city_name => "Paris", :zip_code => "75010", :address => "18S,Rue Boy-Zelenski", :latitude => 48.877508,:longitude => 2.368728},
  {:city_name => "Paris", :zip_code => "75010", :address => "78,Passage Brady", :latitude => 48.871436,:longitude => 2.354498},
  {:city_name => "Paris", :zip_code => "75010", :address => "7B,Passage du Buisson Saint-Louis", :latitude => 48.872544,:longitude => 2.372883},

  #Paris 11th district
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Rue Henri Ranvier", :latitude => 48.85861,:longitude => 2.386745},
  {:city_name => "Paris", :zip_code => "75011", :address => "3,Place Hubertine Auclert", :latitude => 48.858904,:longitude => 2.380658},
  {:city_name => "Paris", :zip_code => "75011", :address => "7,Impasse des Jardiniers", :latitude => 48.852188,:longitude => 2.392034},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Jean Macé", :latitude => 48.852814,:longitude => 2.384627},
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Passage du Jeu de Boules", :latitude => 48.865629,:longitude => 2.367579},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Saint-Maur", :latitude => 48.858878,:longitude => 2.383424},
]
apprentice_places=[]
mentor_places=[]
admin_places=[]

paris_addresses.each_with_index do |paris_address,i|
  if i > 0 && i <= 50
    apprentice_places << Place.create(
                                city_name: paris_address[:city_name],
                                zip_code: paris_address[:zip_code],
                                address: paris_address[:address],
                                latitude: paris_address[:latitude],
                                longitude: paris_address[:longitude]
                                )
  end

  if i > 51 && i <= 91
    mentor_places << Place.create(
                                city_name: paris_address[:city_name],
                                zip_code: paris_address[:zip_code],
                                address: paris_address[:address],
                                latitude: paris_address[:latitude],
                                longitude: paris_address[:longitude]
                                )
  end

  if i >= 92 && i < 98
    admin_places << Place.create(
                                city_name: paris_address[:city_name],
                                zip_code: paris_address[:zip_code],
                                address: paris_address[:address],
                                latitude: paris_address[:latitude],
                                longitude: paris_address[:longitude]
                                )
  end
  if i >= 99
    break
  end
end
puts "========================================================="
puts "PLACES PARIS APPRENTICE    :#{apprentice_places.count}/50"
puts "PLACES PARIS MENTOR        :#{mentor_places.count}/40"
puts "PLACES PARIS ADMINS        :#{admin_places.count}/6"
puts "---------------------------------------------------------"
puts "PLACES TOTAL               : #{Place.count}/96"
puts "========================================================="



# --- USERS ---
apprentice_users=[]
mentor_users=[]
admin_users=[]

apprentice_places.each do |place|
  first_n = Faker::Name.first_name
  last_n = Faker::Name.unique.last_name
  apprentice_users << User.create(
                                  first_name: first_n,
                                  last_name: last_n,
                                  email: first_n[0].downcase + last_n.downcase + "@yopmail.com",
                                  password: "Password",
                                  password_confirmation: "Password",
                                  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                                  place_id: place.id,
                                  is_admin: false
                                  )
  # Place.last.destroy
end

mentor_places.each do |place|
  first_n = Faker::Name.first_name
  last_n = Faker::Name.unique.last_name
  mentor_users << User.create(
                              first_name: first_n,
                              last_name: last_n,
                              email: first_n[0].downcase + last_n.downcase + "@yopmail.com",
                              password: "Password",
                              password_confirmation: "Password",
                              phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                              place_id: place.id,
                              is_admin: true
                              )
  # Place.last.destroy
end

admin_places.each_with_index do |place,i|
  case i
    when 0
      first_n = "Diane"
      last_n = "DECOURT"
    when 1
      first_n = "Mehdi Lucas"
      last_n = "AMMAR"
    when 2
      first_n = "Patrice"
      last_n = "HUSZEZO"
    when 3
      first_n = "Rémi"
      last_n = "BARNAT"
    when 4
      first_n = "Yohan"
      last_n = "FLEURY"
    when 5
      first_n = "Admin"
      last_n = "TALENTCO"
    else
      first_n = "Autre"
      last_n = "AUTRE"
  end
  admin_users << User.create(
                              first_name: first_n,
                              last_name: last_n,
                              email: first_n[0].downcase + last_n.downcase + "@yopmail.com",
                              password: "Password",
                              password_confirmation: "Password",
                              phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                              place_id: place.id,
                              is_admin: true
                              )
  # Place.last.destroy
end
puts "========================================================="
puts "USERS APPRENTICE           : #{apprentice_users.count}/50"
puts "USERS MENTOR               : #{mentor_users.count}/40"
puts "USERS ADMIN                : #{admin_users.count}/6"
puts "---------------------------------------------------------"
puts "USERS TOTAL                : #{User.count}/96"
puts "========================================================="



# --- CATEGORIES ---
categories=[]

category_constants = 
[
  {:title => "Arts de la scène"},   # id= 1
  {:title => "Arts manuels & DIY"}, # id= 2
  {:title => "Arts visuels"},       # id= 3
  {:title => "Coktails & Boissons"},# id= 4
  {:title => "Collectioneurs"},     # id= 5
  {:title => "Cuisine"},            # id= 6
  {:title => "Musique"},            # id= 7
  {:title => "Spirituels"},         # id= 8
  {:title => "Sports"},             # id= 9
]
category_constants.each do |category|
  categories << Category.create(title: category[:title])
end
puts "========================================================="
puts "CATEGORIES TOTAL           : #{Category.count}/9"
puts "========================================================="



# --- TALENTS AND JOIN TABLE TALENTS CATEGORIES---


talents_constants = 
[
  {:title => "La Calligraphie c'est la vie !", :description => "Tu es passionné d'écriture, ou simplement amoureux des belles lettres ? Participe à cet atelier mélant découverte et mise en pratique de ce qui est défini comme l'art du trait. Tu y découvriras les calligraphies chinoise, latine et arabe, et pourras bien sûr repartir avec tes propres réalisations. Intéressé ? Alors réserve vite une séance !",:picture_name => "talent_calligraphy.jpg", :category_id =>  3},
  {:title => "Entrechats entre nous : entre dans la danse !", :description => "Amoureux de danse classique, mais n'ayant jamais osé franchir la porte d'un studio ? Cet atelier est fait pour toi. Tu pourras, de manière moins formelle et surtout à ton rythme, t'initier aux bases de la danse classique. Je suis une ancienne étoile de l'opéra de Paris, qui a à coeur de partager sa passion. Rejoins-moi vite en réservant ta séance.",:picture_name => "talent_classic_dance.jpg", :category_id =>  1},
  {:title => "Initiation à l'escalade", :description => "Intéressé par la découverte de l'escalade, dans un cadre sympa et informel ? Cette séance est faite pour toi. Il s'agit d'y découvrir les bases et t'ouvrir la voie d'une pratique mélant sécurité et plaisir. Inscris-toi vite !",:picture_name => "talent_climb.jpg", :category_id =>  9},
  {:title => "Escalade : vers l'infini et au delà !", :description => "Tu possèdes déjà de bonnes bases, et recherche des conseils précieux pour t'aider à franchir de nouveaux sommets ? Cet atelier est fait pour toi. Je suis un vrai passionné ayant déjà gravi plusieurs sommets mythiques dont le célèbre K2. Je t'offrirai une aide personnalisée, en fonction de tes propres objectifs. Alors inscris-toi vite !",:picture_name => "talent_climb1.jpg", :category_id =>  9},
  {:title => "Les basics de l'escalade", :description => "Tu as envie de découvrir l'escalade dans un cadre sympa ? Alors rejoins-moi pour une séance de découverte. Nous y découvrirons les quelques principes qui te permettront de te faire plaisir, tout en sécurité. Inscris-toi vite!",:picture_name => "talent_climb2.jpg", :category_id =>  9},

  {:title => "Kokedama: nature is in the air !", :description => "Tu te demande comment prendre soin de cette plante, ou souhaite t'initier à cet art en provenance du Japon ? Viens participer à une séance. Je suis une passionnée de cet art si particulier : tu en ressortiras transformé !",:picture_name => "talent_cokedama.jpg", :category_id =>  2},
  {:title => "Le secret de la pate brisée", :description => "Tu veux apprendre de nouvelles recettes de tartes sympas et originales, réussies à tous les coups ? Alors réserve une séance pour ce talent tout en saveur! Tu y découvriras les trucs et astuces des plus grands pâtissiers, en plus de te faire plaisir et pouvoir ensuite faire plaisir autour de toi. Qu'est ce que tu fais encore ici ?!",:picture_name => "talent_cooking.jpg", :category_id =>  6},
  {:title => "Salade et métissage", :description => "Vegan de pére en fils, je suis un expert de la salade ! Je t’expliquerais tout ses secrets et tu pourras impressioner tes potes en soirée avec tes nouvelles conaissances sur la laitue et les tomates !",:picture_name => "talent_cooking1.jpg", :category_id =>  6},
  {:title => "Les blancs en neige", :description => "Monter les blancs en neige est une frustration pour beaucoup de personnes... Dans ce cours tu verras que c’est très facile quand on a la technique. Tu pourrass te débarasser de ton batteur éléctrique et désencombrer ton 9m² dans Paris centre !",:picture_name => "talent_cooking2.jpg", :category_id =>  6},
  {:title => "Ramen party !", :description => "Faire des Ramens c’est simple. Mais faire un vrai bon ramen digne de la gastronomie Japonaise c’est pas donné à tout le monde ! J’ai appris la technique ancestrale de Naruto en personne. Il parait qu'aprés l'avoir mangé certains ont décuplé leur réserve de chakra : à toi les meilleurs ninjutsu !",:picture_name => "talent_cooking3.jpg", :category_id =>  6},

  {:title => "Pizza italienne", :description => "Oublie toutes les pizzas que tu as mangé jusqu’à aujourd’hui. Viens apprendre à faire la vrai pizza Napolitaine ! Tu verras comment faire le tout maison : de la pâte jusqu’à la sauce. A presto! ",:picture_name => "talent_cooking4.jpg", :category_id =>  6},
  {:title => "Les Madeleines de mamy", :description => "Grand-mère sait faire de bonnes madeleines (et pas seulement du bon café), c’est pour ça que je l’ai sorti de la maison de retraite et remise au boulot ! Viens en profiter en apprenant à les faire comme elle. Offre limité dans le temps vu l’état de ma mémé, alors ne perd pas une seconde et réserve une séance !",:picture_name => "talent_cooking5.jpg", :category_id =>  6},
  {:title => "Crêpes bretonnes", :description => "Une bonne crêpes ca égaye toujours la journée, encore plus quand elle est Bretonne. Viens boire de la Breizh autour d’une bonne crêpe que tu feras toi même grâce à mes conseils avisés. Attention cours interdit au Normand ! (faut pas déconner quand même...)",:picture_name => "talent_cooking6.jpg", :category_id =>  6},
  {:title => "Les pâtes de la mama !", :description => "Ciao a tutti, j’ai 35 ans et j’habite encore chez la mia mamma. Après reflexion je me suis dis que je ne devrais pas être seul à aussi bien manger ! J’ai donc eu l'idée de partager ses recettes avec le monde et vous invitez à venir cuisiner les pâtes avec elle. En tant que gouteur officiel je vous dirais si au bout du cours vous faite la pasta aussi bien que mamma. Peut être auras tu la chance de te voir remettre un certificat (RNCP II) signé par une vrai mamone !",:picture_name => "talent_cooking7.jpg", :category_id =>  6},
  {:title => "Initiation à l'électronique", :description => "Comment le courant circule dans un fil ? Apprenez-en plus sur la tension d'un circuit et construisez votre super circuit ! Repartez avec votre propre kit de video-surveillance IP pour filmer les ébats de votre femme. Le divorce est dans la poche !",:picture_name => "talent_electronic.jpg", :category_id =>  2},

  {:title => "Guitare: s'accompagner", :description => "Pour apprendre à accompagner à la guitare les chansons que l’on aime... S’accompagner en chantant, chanter en s’accompagnant !",:picture_name => "talent_guitare.jpg", :category_id =>  7},
  {:title => "Guitare et improvisation", :description => "Le plus difficile dans l'improvisation, c'est de se lancer. Je vais vous montrer que l'improvisation est bien plus à votre portée que vous n'auriez pu l'imaginer !",:picture_name => "talent_guitare1.jpg", :category_id =>  7},
  {:title => "Solo de guitare", :description => "Méthode de guitare progressive et structurée pour apprendre à jouer note à note les plus grands solos de l'histoire du Rock. Jimmy Hendrix n'a qu'a bien se tenir !",:picture_name => "talent_guitare2.jpg", :category_id =>  7},
  {:title => "Compo à la guitare", :description => "Les manières de composer seront illustrées pour différents ensembles musicaux. On commencera avec quelques principes généraux, puis on appliquera ces principes pour une formation guitare-voix, et enfin pour un quintet instrumental.",:picture_name => "talent_guitare3.jpg", :category_id =>  7},
  {:title => "La guitare électrique", :description => "Vous vous ferez plaisir sur des styles différents : rock, heavy metal, jazz, blues... La sonorité n'a plus rien à voir avec celle d'une guitare acoustique.",:picture_name => "talent_guitare4.jpg", :category_id =>  7},
  
  {:title => "Guitare : les accords", :description => "Apprendre les 8 principaux accords de guitare faciles pour débutants! Ils nous permettent de jouer un très grand nombre de morceaux à la guitare.",:picture_name => "talent_guitare5.jpg", :category_id =>  7},
  {:title => "Guitare et voix", :description => "Ces premiers cours de guitare pour débutants sont parfaits pour commencer. Nous allons aborder tout un tas de sujets pour partir avec les bons réflexes. Comment tenir sa guitare, son médiator ? Ou encore comment savoir lire les notes de guitare ou même comment accorder sa guitare ?",:picture_name => "talent_guitare6.jpg", :category_id =>  7},
  {:title => "Initiation au Camping", :description => "Le camping est un excellent moyen de se rapprocher de la nature. Avec un minimum d’équipement, un peu de planification et quelques connaissances de base vous aurez tout ce qu’il faut pour vivre une excellente expérience. Alors qu'attendez vous pour partir à l'aventure ?",:picture_name => "talent_hike.jpg", :category_id =>  9},
  {:title => "Mes début en tricot", :description => "Vous débutez dans l'apprentissage du tricot ? Après une familiarisation avec le matériel, vous apprendrez à tricoter le point mousse et le point de jersey, pour réaliser vos premiers ouvrages. Vous allez en avoir des choses à raconter à mémé dimanche !",:picture_name => "talent_hook.jpg", :category_id =>  2},
  {:title => "Photo macro", :description => "Mon idée n’est pas de faire de vous des photographes professionnels, mais simplement des photographes amateurs qui aiment faire des photos et de belles photos de près. Nous verrons tout un tas de techniques et astuces adaptées aux photos macros. A toi les photos Instagram de folie !",:picture_name => "talent_photo.jpg", :category_id =>  3},

  {:title => "Photo de scènes", :description => "Depuis quelques mois, je travaille pour le Théâtre La comédie Odéon à Paris. Je m’y rends pour prendre en photo les pièces qui s’y jouent. Rejoignez moi pour apprendre à graver sur péllicule ces instants si riches en émotion !",:picture_name => "talent_photo1.jpg", :category_id =>  3},
  {:title => "Initiation à la photo", :description => "Si les grands principes de la photographie sont toujours un mystère pour toi, n'attend plus pour t'inscrire à cette initiation photo ! Tu auras l'opportunité de mieux comprendre les principaux réglages de ton appareil et pourra l'exploiter à 100% !",:picture_name => "talent_photo2.jpg", :category_id =>  3},
  {:title => "Traitements photo", :description => "Vous débutez en photo et souhaitez comprendre les principaux réglages de votre appareil ? L'Initiation Photo est faite pour vous ! Ce cours photo s'adresse aux débutants ou faux débutants ayant fait l'acquisition d'un appareil photo numérique (reflex, bridge, hybride, compact expert). Il vous aide à acquérir les bases de la photographie et créer les images que vous avez en tête.",:picture_name => "talent_photo3.jpg", :category_id =>  3},
  {:title => "Photo sur portable", :description => "Tu as toujours rêvé de prendre le cliché du siècle avec ce que tu as sous la main ? Tu veux pouvoir manier ton téléphone portable comme un vrai pro ? Nous verrons ensemble comment utiliser les configurations et paramétres des GSM pour arriver à un super rendu : ton compte instagram ne va pas s'en remettre !",:picture_name => "talent_photo4.jpg", :category_id =>  3},
  {:title => "Retouches photo", :description => "Tes clichés sont top mais tu changerais bien un petit détail ou deux ? Tu veux créer des effets de folie pour enjayer tes fans ? Nous verrons ensemble qu'avec Adobe Photoshop Express et GIMP, il existe queqlques fonctionalités qui permettent d'avoir un résultat professionel. A ta souris !",:picture_name => "talent_photo5.jpg", :category_id =>  3},

  {:title => "Débuter le piano", :description => "Il jouait du piano debout, c'est peut-être un détail pour vous, mais pour moi ca veut dire beaucoup ! Si pour toi aussi le piano c'est la vie, et que tu souhaite t'initier, tu es au bon endroit. Je suis soliste dans l'orchestre philarmonique de Paris, et souhaite faire découvrir ce magnifique instrument au plus grand nombre. Alors n'hésites pas à me contacter !",:picture_name => "talent_piano.jpg", :category_id =>  7},
  {:title => "Poterie et compagnie", :description => "Tu as toujours rêvé de réaliser des amphores et des vases comme dans l'ancien temps ? Ca tombe bien c'est ma spécialité. Je suis architecte de métier et passionné par la poterie d'égypte ancienne et de mésopotamie. Nous verrons ensemble les techniques et matériaux autrefois utilisés. Tu es prêt à voyager dans le temps ?",:picture_name => "talent_pottery.jpg", :category_id =>  2},
  {:title => "Initiation à la poterie", :description => "Tu as deux mains gauches et tu t'interesse à la poterie ? Mes ateliers d'initiation vont te donner les clés et fournir le matériel pour que tu puisse avoir les bases. Nous réaliserons ensemble plusieurs basiques que tu seras fier de montrer à tes amis. Alors qu'est ce que tu attends ?",:picture_name => "talent_pottery1.jpg", :category_id =>  2},
  {:title => "La poterie c'est pas sorcier !", :description => "Quand il s'agit de travaux manuels, tu n'as pas de bol et finis toujours par casser tes réalisations ? Nous allons voir ensemble des procédés de fabrication et des matériaux beaucoup plus resistants que l'argile. Je fournis tous les matériel et les matériaux. Tout ce que tu as à faire c'est venir !",:picture_name => "talent_pottery2.jpg", :category_id =>  2},
  {:title => "Techniques de couture", :description => "La couture c'est ton dada ? Tu souhaites savoir adapter ton patron à ta morphologie ? Tu ne sait pas quoi faire lorsque le fil de la machine à coudre casse ? Tu veux savoir coudre des tissus épais ou en surépaisseur ? Je suis couturier de métier depuis plus 40 ans. Maintenant à la retraite je serais ravie de t'apprendre à trouver une aiguille dans une botte de foin !",:picture_name => "talent_sewing.jpg", :category_id =>  2},

  {:title => "Skateboard : les bases", :description => "Ca te donne envie de rider lorsque tu vois Marty sur son Hoverboard dans Retour vers le futur ? Grace à cette séance d'initiation nous allons apprendre la posture et les déplacements de base pour que tu te sente à l'aise sur ta planche. Si tu es sage on testera quelques slides. N'oublie pas tes protecs !",:picture_name => "talent_skateboard.jpg", :category_id =>  9},
  {:title => "Ukulele : initiation", :description => "Tu as la larme à l'oeil à chaque fois que tu entends Over the raimbow de israel kamakawiwo'ole ? Tu veux apprendre un instrument facile à transporter et qui animera tes longues soirées d'hiver ? Je suis la pour t'apprendre toutes les bases du Ukulele avec des morceaux accessibles et adpatés. Les plus grands virtuoses ont tous commencé quelque part. A ton tours de lancer !",:picture_name => "talent_ukulele.jpg", :category_id =>  7},
  {:title => "Les accords en Ukulele", :description => "Tu trouves le Ukulele dans les ziks de Cocoon tellement stylé ? Tu veux pouvoir t'accompagner ou accompagner des pots au chant pour les fin de soirée ? Ce cours est fait pour toi ! Nous verrons tous les accords mineures et majeurs de base, la posture et les positions des mains. Jimmy Hendrix n'a qu'a bien se tenir !",:picture_name => "talent_ukulele1.jpg", :category_id =>  7}
]
talents_constants_admin = []
talents_constants.each_with_index do |talents_constant,i|
  if i < 15
    talents_constants_admin << talents_constant
  end
end

# TALENTS ON MENTORS
talents=[]
talents_constants.each_with_index do |talent,i|
  current_talent = Talent.create(
                            user_id: mentor_users[i].id,
                            title: talent[:title],
                            description: talent[:description],
                            duration: rand(1..8)*60,  
                            place_id: mentor_users[i].id,
                            price: Faker::Number.between(from: 1, to: 30)
                            )
    current_talent.picture.attach(
    io: File.open(
      Rails.root.join(
        'app', 'assets', 'images', talent[:picture_name]
      )
    ), filename: talent[:picture_name],
    content_type: 'image/jpg'
  )
  talents << current_talent
  JoinTableTalentCategory.create(
                                  talent_id: current_talent.id,
                                  category_id: talent[:category_id]
                                  )
end

# TALENTS ON ADMIN TO TEST
talents_admin=[]
talents_constants_admin.each_with_index do |talent,i|
  admin_user =  admin_users.sample
  current_talent = Talent.create(
                            user_id: admin_user.id,
                            title: talent[:title],
                            description: talent[:description],
                            duration: rand(1..8)*60,  
                            place_id: admin_user.id,
                            price: Faker::Number.between(from: 1, to: 30)
                            )
    current_talent.picture.attach(
    io: File.open(
      Rails.root.join(
        'app', 'assets', 'images', talent[:picture_name]
      )
    ), filename: talent[:picture_name],
    content_type: 'image/jpg'
  )
  talents_admin << current_talent
  JoinTableTalentCategory.create(
                                  talent_id: current_talent.id,
                                  category_id: talent[:category_id]
                                  )
end

puts "========================================================="
puts "TALENTS MENTOR              : #{talents.count}/38"
puts "TALENTS ADMIN               : #{talents_admin.count}/15"
puts "---------------------------------------------------------"
puts "TALENTS TOTAL               : #{Talent.count}/53"
puts "J_TALENTS_CATEGORIES TOTAL  : #{JoinTableTalentCategory.count}/53"
puts "========================================================="



# --- APPOINTMENTS ---
past_appointments = []
user_validate_appointments = []
mentor_validate_appointments = []
paid_appointments = []
Talent.all.each do |talent|
  # PAST APPOINTMENTS
  rand(1..5).times do
    past_appointments << Appointment.create(
                  start_time: Faker::Time.between_dates(from: 1.month.ago, to: 1.day.ago, period: :day),
                  mentor_id: talent.user_id,
                  apprentice_id: User.all.sample.id,
                  place_id: talent.place_id,
                  talent_id: talent.id,
                  is_mentor_validate: true,
                  is_paid: true
    )
  end
  # USER VALIDATE APPOINTMENTS
  rand(1..3).times do
    user_validate_appointments << Appointment.create(
                  start_time: Faker::Time.between_dates(from: 1.day.from_now, to: 2.month.from_now, period: :day),
                  mentor_id: talent.user_id,
                  apprentice_id: User.all.sample.id,
                  place_id: talent.place_id,
                  talent_id: talent.id,
                  is_mentor_validate: false,
                  is_paid: false
    )
  end
  # MENTOR VALIDATE APPOINTMENTS
  rand(1..3).times do
    mentor_validate_appointments << Appointment.create(
                  start_time: Faker::Time.between_dates(from: 1.day.from_now, to: 1.month.from_now, period: :day),
                  mentor_id: talent.user_id,
                  apprentice_id: User.all.sample.id,
                  place_id: talent.place_id,
                  talent_id: talent.id,
                  is_mentor_validate: true,
                  is_paid: false
    )
  end
  # PAID APPOINTMENTS
  rand(1..3).times do
    paid_appointments << Appointment.create(
                  start_time: Faker::Time.between_dates(from: 1.day.from_now, to: 1.month.from_now, period: :day),
                  mentor_id: talent.user_id,
                  apprentice_id: User.all.sample.id,
                  place_id: talent.place_id,
                  talent_id: talent.id,
                  is_mentor_validate: true,
                  is_paid: true
    )
  end
end
puts "========================================================="
puts "PAST APPOINTMENTS           : #{past_appointments.count}"
puts "USER VALIDATE APPOINTMENTS  : #{user_validate_appointments.count}"
puts "MENTOR VALIDATE APPOINTMENTS: #{mentor_validate_appointments.count}"
puts "PAID APPOINTMENTS           : #{paid_appointments.count}"
puts "---------------------------------------------------------"
puts "APPOINTMENTS TOTAL          : #{Appointment.count}"
puts "========================================================="




# --- BOOKMARKS ---
Talent.all.each do |talent|
  # PAST APPOINTMENTS
  rand(5..20).times do
    Bookmark.create(
                  user_id: User.all.sample.id,
                  talent_id: talent.id
    )
  end
end
puts "========================================================="
puts "BOOKMARKS TOTAL              : #{Bookmark.count}"
puts "========================================================="




# --- REVIEWS ---
comment_constants = [
  {:comment => "C'était chouette, je recommande ce mentor !", :note => 4},
  {:comment => "La séance d'essai m'a vraiment permi de découvrir un nouveau monde, Merci !!", :note => 5},
  {:comment => "Le temps est passé tellement vite... à quand un prochaine séance ?", :note => 5},
  {:comment => "Le mentor a pris le temps de bien m'expliquer. Dommage que ce soit payant !", :note => 2},
  {:comment => "Merci à mon mentor qui a assuré !", :note => 4},
  {:comment => "Pourquoi ne pas proposer plus de contenu dans les séances ?", :note => 3},
  {:comment => "J'ai adoré !", :note => 5},
  {:comment => "Le mentor m'a bien aidé !", :note => 4},
  {:comment => "Ca y est je suis lancé. Un grand merci !", :note => 5},
  {:comment => "Waaaw c'était génial !!", :note => 5},
  {:comment => "J'aurais aimé que cela dure plus longtemps ^^ !", :note => 4},
  {:comment => "Mon mentor m'a posé un lapin !", :note => 1},
  {:comment => "Cette activité m'a beaucoup plu !", :note => 5},
  {:comment => "Je me sens beaucoup plus à l'aise, merci !", :note => 5},
]
past_appointments.each do |appointment|
  current_comment = comment_constants.sample
  # PAST APPOINTMENTS
  Review.create(
                appointment_id: appointment.id,
                mark: current_comment[:note],
                comment: current_comment[:comment]
  )
end
puts "========================================================="
puts "REVIEWS TOTAL               : #{Review.count}"
puts "========================================================="



# --- MESSAGES ---
messages_constants = [
  {:question => "Bonjour je souhaiterais en savoir un peu plus. Peux-tu me renseigner ?", :answer => "Bonjour ! oui bien entendu dis moi ce que tu souhaites savoir :)"},
  {:question => "Salut, je cherche une personne aguerri. Es-tu mon Homme ? :D", :answer => "Salut à toi ! J'ai plus de 10 ans d'expérience! Ca devrait faire l'affaire non ? ;)"},
  {:question => "Bonjour ! ", :answer => "Bonjour, est ce que je peux te renseigner ?"},
  {:question => "Salut ! ", :answer => "Salut, qu'est ce que je peux faire pour toi ?"},
  {:question => "Salut ! J'ai un ami qui m'a parlé de ton talent. C'est pas trop dur à apprendre ?", :answer => "Bonjour, non on commence en douceur avec les basiques ne t'inquiète pas ! :)"},
]
Talent.all.each do |talent|
  rand(1..3).times do
    current_message = messages_constants.sample
    current_apprentice = apprentice_users.sample
    # APPRENTICE MESSAGE
    Message.create(
                  talent_id: talent.id,
                  sender_id: current_apprentice.id,
                  recipient_id: talent.user_id,
                  content: current_message[:question]
    )
    # MENTOR MESSAGE
    Message.create(
      talent_id: talent.id,
      sender_id: talent.user_id,
      recipient_id: current_apprentice.id,
      content: current_message[:answer]
    )
  end
end
puts "========================================================="
puts "MESSAGES TOTAL               : #{Message.count}"
puts "========================================================="

puts " "
puts " "
puts " "
puts " "
puts " "
puts "*********************************************************"
puts "*********************************************************"
puts "**                       SEED                          **"
puts "*********************************************************"
puts "*********************************************************"
puts "========================================================="
puts "PLACES PARIS APPRENTICE     :#{apprentice_places.count}/50"
puts "PLACES PARIS MENTOR         :#{mentor_places.count}/40"
puts "PLACES PARIS ADMINS         :#{admin_places.count}/6"
puts "---------------------------------------------------------"
puts "PLACES TOTAL                : #{Place.count}/96"
puts "========================================================="
puts "USERS APPRENTICE            : #{apprentice_users.count}/50"
puts "USERS MENTOR                : #{mentor_users.count}/40"
puts "USERS ADMIN                 : #{admin_users.count}/6"
puts "---------------------------------------------------------"
puts "USERS TOTAL                 : #{User.count}/96"
puts "========================================================="
puts "CATEGORIES TOTAL            : #{Category.count}/9"
puts "========================================================="
puts "TALENTS MENTOR              : #{talents.count}/38"
puts "TALENTS ADMIN               : #{talents_admin.count}/15"
puts "---------------------------------------------------------"
puts "TALENTS TOTAL               : #{Talent.count}/53"
puts "J_TALENTS_CATEGORIES TOTAL  : #{JoinTableTalentCategory.count}/53"
puts "========================================================="
puts "PAST APPOINTMENTS           : #{past_appointments.count}"
puts "USER VALIDATE APPOINTMENTS  : #{user_validate_appointments.count}"
puts "MENTOR VALIDATE APPOINTMENTS: #{mentor_validate_appointments.count}"
puts "PAID APPOINTMENTS           : #{paid_appointments.count}"
puts "---------------------------------------------------------"
puts "APPOINTMENTS TOTAL          : #{Appointment.count}"
puts "========================================================="
puts "BOOKMARKS TOTAL             : #{Bookmark.count}"
puts "========================================================="
puts "REVIEWS TOTAL               : #{Review.count}"
puts "========================================================="
puts "MESSAGES TOTAL              : #{Message.count}"
puts "========================================================="
puts "*********************************************************"
puts "**TOTAL MODELS CREATED      : #{Place.count + User.count + Category.count + Talent.count + JoinTableTalentCategory.count + Appointment.count + Bookmark.count + Review.count + Message.count}"
puts "*********************************************************"