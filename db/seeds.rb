require 'faker'
require 'activerecord-reset-pk-sequence'

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
cities = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", 
          "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille"]
zipcodes = ["75001", "13001", "69001", "31000", "06000", 
            "44000", "34000", "67000", "33000", "59000"]

# PARIS
paris_adresses = 
[
  #Paris 1er Arrondissement
  {:city_name => "Paris", :zip_code => "75001", :address => "11 rue d'Alger", :latitude => 48.865572,:longitude => 2.329904},
  {:city_name => "Paris", :zip_code => "75001", :address => "8 rue de l'Amiral de Coligny", :latitude => 48.86067,:longitude => 2.340928},
  {:city_name => "Paris", :zip_code => "75001", :address => "2 place André Malraux", :latitude => 48.863963,:longitude => 2.335737},
  {:city_name => "Paris", :zip_code => "75001", :address => "15 rue de l'Arbre Sec", :latitude => 48.859682,:longitude => 2.341897},
  {:city_name => "Paris", :zip_code => "75001", :address => "25B rue d'Argenteuil", :latitude => 48.866215,:longitude => 2.333242},
  #Paris 2eme Arrondissement
  {:city_name => "Paris", :zip_code => "75002", :address => "50 rue Dalayrac", :latitude => 48.868181,:longitude => 2.335286},
  {:city_name => "Paris", :zip_code => "75002", :address => "20 rue Danielle Casanova", :latitude => 48.868059,:longitude => 2.33145},
  {:city_name => "Paris", :zip_code => "75002", :address => "1 rue des Degrés", :latitude => 48.869399,:longitude => 2.350622},
  {:city_name => "Paris", :zip_code => "75002", :address => "28 rue Dussoubs", :latitude => 48.866156,:longitude => 2.349107},
  {:city_name => "Paris", :zip_code => "75002", :address => "14 rue Étienne Marcel", :latitude => 48.864006,:longitude => 2.348835},

  #Paris 3eme Arrondissement
  {:city_name => "Paris", :zip_code => "75003", :address => "2 rue Blondel", :latitude => 48.868496,:longitude => 2.355043},
  {:city_name => "Paris", :zip_code => "75003", :address => "9,Rue du Bourg l'Abbé", :latitude => 48.864018,:longitude => 2.351698},
  {:city_name => "Paris", :zip_code => "75003", :address => "13,Rue de Braque", :latitude => 48.861192,:longitude => 2.356174},
  {:city_name => "Paris", :zip_code => "75003", :address => "47B,Rue de Bretagne", :latitude => 48.863346,:longitude => 2.361409},
  {:city_name => "Paris", :zip_code => "75003", :address => "49,Rue Charlot", :latitude => 48.863264,:longitude => 2.362949},
  #Paris 4eme Arrondissement
  {:city_name => "Paris", :zip_code => "75004", :address => "75,Rue Saint-Antoine", :latitude => 48.854408,:longitude => 2.363073},
  {:city_name => "Paris", :zip_code => "75004", :address => "16,Rue Sainte-Croix Bretonnerie", :latitude => 48.858089,:longitude => 2.356706},
  {:city_name => "Paris", :zip_code => "75004", :address => "3,Place Saint-Gervais", :latitude => 48.855673,:longitude => 2.3543},
  {:city_name => "Paris", :zip_code => "75004", :address => "42,Rue Saint-Louis en l'Île", :latitude => 48.851714,:longitude => 2.356989},
  {:city_name => "Paris", :zip_code => "75004", :address => "120,Rue Saint-Martin", :latitude => 48.860577,:longitude => 2.351205},

  #Paris 5eme Arrondissement
  {:city_name => "Paris", :zip_code => "75005", :address => "36,Rue du Fer à Moulin", :latitude => 48.838906,:longitude => 2.352837},
  {:city_name => "Paris", :zip_code => "75005", :address => "8,Rue des Feuillantines", :latitude => 48.841737,:longitude => 2.3424},
  {:city_name => "Paris", :zip_code => "75005", :address => "14,Rue des Fossés Saint-Bernard", :latitude => 48.848736,:longitude => 2.355045},
  {:city_name => "Paris", :zip_code => "75005", :address => "11,Rue Frédéric Sauton", :latitude => 48.850876,:longitude => 2.349118},
  {:city_name => "Paris", :zip_code => "75005", :address => "9,Rue Fustel de Coulanges", :latitude => 48.839406,:longitude => 2.339694},

  #Paris 6eme Arrondissement
  {:city_name => "Paris", :zip_code => "75006", :address => "19,Rue Mazarine", :latitude => 48.855102,:longitude => 2.337892},
  {:city_name => "Paris", :zip_code => "75006", :address => "5BIS,Rue André Mazet", :latitude => 48.853895,:longitude => 2.339174},
  {:city_name => "Paris", :zip_code => "75006", :address => "9B,Rue de Mézières", :latitude => 48.850213,:longitude => 2.331446},
  {:city_name => "Paris", :zip_code => "75006", :address => "14,Rue Monsieur le Prince", :latitude => 48.850426,:longitude => 2.339608},
  {:city_name => "Paris", :zip_code => "75006", :address => "101,Boulevard du Montparnasse", :latitude => 48.842485,:longitude => 2.328727},

  #Paris 7eme Arrondissement
  {:city_name => "Paris", :zip_code => "75007", :address => "53,Rue Cler", :latitude => 48.85607,:longitude => 2.306868},
  {:city_name => "Paris", :zip_code => "75007", :address => "10,Rue Cognacq Jay", :latitude => 48.861861,:longitude => 2.304083},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de la Comète", :latitude => 48.858742,:longitude => 2.309221},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de Constantine", :latitude => 48.859858,:longitude => 2.314948},
  {:city_name => "Paris", :zip_code => "75007", :address => "6,Rue Desgenettes", :latitude => 48.861811,:longitude => 2.309648},
  #Paris 8eme Arrondissement
  {:city_name => "Paris", :zip_code => "75008", :address => "15,Rue de la Bienfaisance", :latitude => 48.876576,:longitude => 2.317404},
  {:city_name => "Paris", :zip_code => "75008", :address => "6,Rue du Boccador", :latitude => 48.866348,:longitude => 2.303441},
  {:city_name => "Paris", :zip_code => "75008", :address => "25,Rue Boissy d'Anglas", :latitude => 48.869289,:longitude => 2.322053},
  {:city_name => "Paris", :zip_code => "75008", :address => "9,Rue de Bucarest", :latitude => 48.880633,:longitude => 2.326189},
  {:city_name => "Paris", :zip_code => "75008", :address => "104,Avenue des Champs-Élysées", :latitude => 48.872094,:longitude => 2.301611},

  #Paris 9eme Arrondissement
  {:city_name => "Paris", :zip_code => "75009", :address => "3,Rue Blanche", :latitude => 48.877403,:longitude => 2.332041},
  {:city_name => "Paris", :zip_code => "75009", :address => "1S,Impasse de la Boule Rouge", :latitude => 48.873569,:longitude => 2.34383},
  {:city_name => "Paris", :zip_code => "75009", :address => "38,Rue de Bruxelles", :latitude => 48.882923,:longitude => 2.328497},
  {:city_name => "Paris", :zip_code => "75009", :address => "4,Rue de Budapest", :latitude => 48.876075,:longitude => 2.32771},
  {:city_name => "Paris", :zip_code => "75009", :address => "16B,Rue Cadet", :latitude => 48.874924,:longitude => 2.343079},
  #Paris 10eme Arrondissement
  {:city_name => "Paris", :zip_code => "75010", :address => "4TER,Boulevard de Bonne Nouvelle", :latitude => 48.870049,:longitude => 2.352418},
  {:city_name => "Paris", :zip_code => "75010", :address => "10,Rue Bouchardon", :latitude => 48.869931,:longitude => 2.35742},
  {:city_name => "Paris", :zip_code => "75010", :address => "18S,Rue Boy-Zelenski", :latitude => 48.877508,:longitude => 2.368728},
  {:city_name => "Paris", :zip_code => "75010", :address => "78,Passage Brady", :latitude => 48.871436,:longitude => 2.354498},
  {:city_name => "Paris", :zip_code => "75010", :address => "7B,Passage du Buisson Saint-Louis", :latitude => 48.872544,:longitude => 2.372883},

  #Paris 11eme Arrondissement
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Rue Henri Ranvier", :latitude => 48.85861,:longitude => 2.386745},
  {:city_name => "Paris", :zip_code => "75011", :address => "3,Place Hubertine Auclert", :latitude => 48.858904,:longitude => 2.380658},
  {:city_name => "Paris", :zip_code => "75011", :address => "7,Impasse des Jardiniers", :latitude => 48.852188,:longitude => 2.392034},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Jean Macé", :latitude => 48.852814,:longitude => 2.384627},
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Passage du Jeu de Boules", :latitude => 48.865629,:longitude => 2.367579},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Saint-Maur", :latitude => 48.858878,:longitude => 2.383424},

  #Paris 1er Arrondissement
  {:city_name => "Paris", :zip_code => "75001", :address => "11 rue d'Alger", :latitude => 48.865572,:longitude => 2.329904},
  {:city_name => "Paris", :zip_code => "75001", :address => "8 rue de l'Amiral de Coligny", :latitude => 48.86067,:longitude => 2.340928},
  {:city_name => "Paris", :zip_code => "75001", :address => "2 place André Malraux", :latitude => 48.863963,:longitude => 2.335737},
  {:city_name => "Paris", :zip_code => "75001", :address => "15 rue de l'Arbre Sec", :latitude => 48.859682,:longitude => 2.341897},
  {:city_name => "Paris", :zip_code => "75001", :address => "25B rue d'Argenteuil", :latitude => 48.866215,:longitude => 2.333242},
  #Paris 2eme Arrondissement
  {:city_name => "Paris", :zip_code => "75002", :address => "50 rue Dalayrac", :latitude => 48.868181,:longitude => 2.335286},
  {:city_name => "Paris", :zip_code => "75002", :address => "20 rue Danielle Casanova", :latitude => 48.868059,:longitude => 2.33145},
  {:city_name => "Paris", :zip_code => "75002", :address => "1 rue des Degrés", :latitude => 48.869399,:longitude => 2.350622},
  {:city_name => "Paris", :zip_code => "75002", :address => "28 rue Dussoubs", :latitude => 48.866156,:longitude => 2.349107},
  {:city_name => "Paris", :zip_code => "75002", :address => "14 rue Étienne Marcel", :latitude => 48.864006,:longitude => 2.348835},

  #Paris 3eme Arrondissement
  {:city_name => "Paris", :zip_code => "75003", :address => "2 rue Blondel", :latitude => 48.868496,:longitude => 2.355043},
  {:city_name => "Paris", :zip_code => "75003", :address => "9,Rue du Bourg l'Abbé", :latitude => 48.864018,:longitude => 2.351698},
  {:city_name => "Paris", :zip_code => "75003", :address => "13,Rue de Braque", :latitude => 48.861192,:longitude => 2.356174},
  {:city_name => "Paris", :zip_code => "75003", :address => "47B,Rue de Bretagne", :latitude => 48.863346,:longitude => 2.361409},
  {:city_name => "Paris", :zip_code => "75003", :address => "49,Rue Charlot", :latitude => 48.863264,:longitude => 2.362949},
  #Paris 4eme Arrondissement
  {:city_name => "Paris", :zip_code => "75004", :address => "75,Rue Saint-Antoine", :latitude => 48.854408,:longitude => 2.363073},
  {:city_name => "Paris", :zip_code => "75004", :address => "16,Rue Sainte-Croix Bretonnerie", :latitude => 48.858089,:longitude => 2.356706},
  {:city_name => "Paris", :zip_code => "75004", :address => "3,Place Saint-Gervais", :latitude => 48.855673,:longitude => 2.3543},
  {:city_name => "Paris", :zip_code => "75004", :address => "42,Rue Saint-Louis en l'Île", :latitude => 48.851714,:longitude => 2.356989},
  {:city_name => "Paris", :zip_code => "75004", :address => "120,Rue Saint-Martin", :latitude => 48.860577,:longitude => 2.351205},

  #Paris 5eme Arrondissement
  {:city_name => "Paris", :zip_code => "75005", :address => "36,Rue du Fer à Moulin", :latitude => 48.838906,:longitude => 2.352837},
  {:city_name => "Paris", :zip_code => "75005", :address => "8,Rue des Feuillantines", :latitude => 48.841737,:longitude => 2.3424},
  {:city_name => "Paris", :zip_code => "75005", :address => "14,Rue des Fossés Saint-Bernard", :latitude => 48.848736,:longitude => 2.355045},
  {:city_name => "Paris", :zip_code => "75005", :address => "11,Rue Frédéric Sauton", :latitude => 48.850876,:longitude => 2.349118},
  {:city_name => "Paris", :zip_code => "75005", :address => "9,Rue Fustel de Coulanges", :latitude => 48.839406,:longitude => 2.339694},

  #Paris 6eme Arrondissement
  {:city_name => "Paris", :zip_code => "75006", :address => "19,Rue Mazarine", :latitude => 48.855102,:longitude => 2.337892},
  {:city_name => "Paris", :zip_code => "75006", :address => "5BIS,Rue André Mazet", :latitude => 48.853895,:longitude => 2.339174},
  {:city_name => "Paris", :zip_code => "75006", :address => "9B,Rue de Mézières", :latitude => 48.850213,:longitude => 2.331446},
  {:city_name => "Paris", :zip_code => "75006", :address => "14,Rue Monsieur le Prince", :latitude => 48.850426,:longitude => 2.339608},
  {:city_name => "Paris", :zip_code => "75006", :address => "101,Boulevard du Montparnasse", :latitude => 48.842485,:longitude => 2.328727},

  #Paris 7eme Arrondissement
  {:city_name => "Paris", :zip_code => "75007", :address => "53,Rue Cler", :latitude => 48.85607,:longitude => 2.306868},
  {:city_name => "Paris", :zip_code => "75007", :address => "10,Rue Cognacq Jay", :latitude => 48.861861,:longitude => 2.304083},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de la Comète", :latitude => 48.858742,:longitude => 2.309221},
  {:city_name => "Paris", :zip_code => "75007", :address => "17,Rue de Constantine", :latitude => 48.859858,:longitude => 2.314948},
  {:city_name => "Paris", :zip_code => "75007", :address => "6,Rue Desgenettes", :latitude => 48.861811,:longitude => 2.309648},
  #Paris 8eme Arrondissement
  {:city_name => "Paris", :zip_code => "75008", :address => "15,Rue de la Bienfaisance", :latitude => 48.876576,:longitude => 2.317404},
  {:city_name => "Paris", :zip_code => "75008", :address => "6,Rue du Boccador", :latitude => 48.866348,:longitude => 2.303441},
  {:city_name => "Paris", :zip_code => "75008", :address => "25,Rue Boissy d'Anglas", :latitude => 48.869289,:longitude => 2.322053},
  {:city_name => "Paris", :zip_code => "75008", :address => "9,Rue de Bucarest", :latitude => 48.880633,:longitude => 2.326189},
  {:city_name => "Paris", :zip_code => "75008", :address => "104,Avenue des Champs-Élysées", :latitude => 48.872094,:longitude => 2.301611},

  #Paris 9eme Arrondissement
  {:city_name => "Paris", :zip_code => "75009", :address => "3,Rue Blanche", :latitude => 48.877403,:longitude => 2.332041},
  {:city_name => "Paris", :zip_code => "75009", :address => "1S,Impasse de la Boule Rouge", :latitude => 48.873569,:longitude => 2.34383},
  {:city_name => "Paris", :zip_code => "75009", :address => "38,Rue de Bruxelles", :latitude => 48.882923,:longitude => 2.328497},
  {:city_name => "Paris", :zip_code => "75009", :address => "4,Rue de Budapest", :latitude => 48.876075,:longitude => 2.32771},
  {:city_name => "Paris", :zip_code => "75009", :address => "16B,Rue Cadet", :latitude => 48.874924,:longitude => 2.343079},
  #Paris 10eme Arrondissement
  {:city_name => "Paris", :zip_code => "75010", :address => "4TER,Boulevard de Bonne Nouvelle", :latitude => 48.870049,:longitude => 2.352418},
  {:city_name => "Paris", :zip_code => "75010", :address => "10,Rue Bouchardon", :latitude => 48.869931,:longitude => 2.35742},
  {:city_name => "Paris", :zip_code => "75010", :address => "18S,Rue Boy-Zelenski", :latitude => 48.877508,:longitude => 2.368728},
  {:city_name => "Paris", :zip_code => "75010", :address => "78,Passage Brady", :latitude => 48.871436,:longitude => 2.354498},
  {:city_name => "Paris", :zip_code => "75010", :address => "7B,Passage du Buisson Saint-Louis", :latitude => 48.872544,:longitude => 2.372883},

  #Paris 11eme Arrondissement
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Rue Henri Ranvier", :latitude => 48.85861,:longitude => 2.386745},
  {:city_name => "Paris", :zip_code => "75011", :address => "3,Place Hubertine Auclert", :latitude => 48.858904,:longitude => 2.380658},
  {:city_name => "Paris", :zip_code => "75011", :address => "7,Impasse des Jardiniers", :latitude => 48.852188,:longitude => 2.392034},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Jean Macé", :latitude => 48.852814,:longitude => 2.384627},
  {:city_name => "Paris", :zip_code => "75011", :address => "10,Passage du Jeu de Boules", :latitude => 48.865629,:longitude => 2.367579},
  {:city_name => "Paris", :zip_code => "75011", :address => "4,Rue Saint-Maur", :latitude => 48.858878,:longitude => 2.383424},
  
  #Paris 12eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75012", :address => "13,Rue Abel", :latitude => 48.847782,:longitude => 2.37549}
  # {:city_name => "Paris", :zip_code => "75012", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75012", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75012", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75012", :address => "test", :latitude => test,:longitude => test},

  # #Paris 13eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75013", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75013", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75013", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75013", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75013", :address => "test", :latitude => test,:longitude => test},
  # #Paris 14eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75014", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75014", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75014", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75014", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75014", :address => "test", :latitude => test,:longitude => test},

  # #Paris 15eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75015", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75015", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75015", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75015", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75015", :address => "test", :latitude => test,:longitude => test},
  # #Paris 16eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75016", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75016", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75016", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75016", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75016", :address => "test", :latitude => test,:longitude => test},

  # #Paris 17eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75017", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75017", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75017", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75017", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75017", :address => "test", :latitude => test,:longitude => test},
  # #Paris 18eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75018", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75018", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75018", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75018", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75018", :address => "test", :latitude => test,:longitude => test},

  # #Paris 19eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75019", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75019", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75019", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75019", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75019", :address => "test", :latitude => test,:longitude => test},
  # #Paris 20eme Arrondissement
  # {:city_name => "Paris", :zip_code => "75020", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75020", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75020", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75020", :address => "test", :latitude => test,:longitude => test},
  # {:city_name => "Paris", :zip_code => "75020", :address => "test", :latitude => test,:longitude => test}
]
apprentice_places=[]
mentor_places=[]
admin_places=[]

paris_adresses.each_with_index do |paris_adresse,i|
  if i > 0 && i <= 50
    apprentice_places << Place.create(
                                city_name: paris_adresse[:city_name],
                                zip_code: paris_adresse[:zip_code],
                                address: paris_adresse[:address],
                                latitude: paris_adresse[:latitude],
                                longitude: paris_adresse[:longitude]
                                )
  end

  if i > 51 && i <= 91
    mentor_places << Place.create(
                                city_name: paris_adresse[:city_name],
                                zip_code: paris_adresse[:zip_code],
                                address: paris_adresse[:address],
                                latitude: paris_adresse[:latitude],
                                longitude: paris_adresse[:longitude]
                                )
  end

  if i >= 92 && i < 98
    admin_places << Place.create(
                                city_name: paris_adresse[:city_name],
                                zip_code: paris_adresse[:zip_code],
                                address: paris_adresse[:address],
                                latitude: paris_adresse[:latitude],
                                longitude: paris_adresse[:longitude]
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
  {:title => "La Calligraphie c'est la vie !", :description => "",:picture_name => "talent_calligraphy.jpg", :category_id =>  3},
  {:title => "Entrechats entre nous : entre dans la danse !", :description => "",:picture_name => "talent_classic_dance.jpg", :category_id =>  1},
  {:title => "Initiation à l'escalade", :description => "",:picture_name => "talent_climb.jpg", :category_id =>  9},
  {:title => "Escalade : vers l'infini et au delà !", :description => "",:picture_name => "talent_climb1.jpg", :category_id =>  9},
  {:title => "Les basics de l'escalade", :description => "",:picture_name => "talent_climb2.jpg", :category_id =>  9},

  {:title => "Cokedama: nature is in the air !", :description => "",:picture_name => "talent_cokedama.jpg", :category_id =>  2},
  {:title => "Le secret de la pate brisée", :description => "",:picture_name => "talent_cooking.jpg", :category_id =>  6},
  {:title => "Sallade et métissage", :description => "",:picture_name => "talent_cooking1.jpg", :category_id =>  6},
  {:title => "Les blancs en neige", :description => "",:picture_name => "talent_cooking2.jpg", :category_id =>  6},
  {:title => "Ramen party !", :description => "",:picture_name => "talent_cooking3.jpg", :category_id =>  6},

  {:title => "Pizza italienne", :description => "",:picture_name => "talent_cooking4.jpg", :category_id =>  6},
  {:title => "Les Madeleines de mamy", :description => "",:picture_name => "talent_cooking5.jpg", :category_id =>  6},
  {:title => "Crêpes bretonnes", :description => "",:picture_name => "talent_cooking6.jpg", :category_id =>  6},
  {:title => "Les pâtes de la mama !", :description => "",:picture_name => "talent_cooking7.jpg", :category_id =>  6},
  {:title => "Initiation à l'électronique", :description => "",:picture_name => "talent_electronic.jpg", :category_id =>  2},

  {:title => "Guitare: s'accompagner", :description => "",:picture_name => "talent_guitare.jpg", :category_id =>  7},
  {:title => "Guitare et improvisation", :description => "",:picture_name => "talent_guitare1.jpg", :category_id =>  7},
  {:title => "Solo de guitare", :description => "",:picture_name => "talent_guitare2.jpg", :category_id =>  7},
  {:title => "Compo à la guitare", :description => "",:picture_name => "talent_guitare3.jpg", :category_id =>  7},
  {:title => "La guitare électrique", :description => "",:picture_name => "talent_guitare4.jpg", :category_id =>  7},

  {:title => "Guitare : les accords", :description => "",:picture_name => "talent_guitare5.jpg", :category_id =>  7},
  {:title => "Guitare et voix", :description => "",:picture_name => "talent_guitare6.jpg", :category_id =>  7},
  {:title => "Initiation au Camping", :description => "",:picture_name => "talent_hike.jpg", :category_id =>  9},
  {:title => "Mes début en crochet", :description => "",:picture_name => "talent_hook.jpg", :category_id =>  2},
  {:title => "Photo macro", :description => "",:picture_name => "talent_photo.jpg", :category_id =>  3},

  {:title => "Photo de scènes", :description => "",:picture_name => "talent_photo1.jpg", :category_id =>  3},
  {:title => "Initiation à la photo", :description => "",:picture_name => "talent_photo2.jpg", :category_id =>  3},
  {:title => "Traitements photo", :description => "",:picture_name => "talent_photo3.jpg", :category_id =>  3},
  {:title => "Photo sur portable", :description => "",:picture_name => "talent_photo4.jpg", :category_id =>  3},
  {:title => "Retouches photo", :description => "",:picture_name => "talent_photo5.jpg", :category_id =>  3},

  {:title => "Débuter le piano", :description => "",:picture_name => "talent_piano.jpg", :category_id =>  7},
  {:title => "Poterie et compagnie", :description => "",:picture_name => "talent_pottery.jpg", :category_id =>  2},
  {:title => "Initiation à la poterie", :description => "",:picture_name => "talent_pottery1.jpg", :category_id =>  2},
  {:title => "La poterie c'est pas sorcier !", :description => "",:picture_name => "talent_pottery2.jpg", :category_id =>  2},
  {:title => "Techniques de couture", :description => "",:picture_name => "talent_sewing.jpg", :category_id =>  2},

  {:title => "Skateboard : les bases", :description => "",:picture_name => "talent_skateboard.jpg", :category_id =>  9},
  {:title => "Ukulele : initiation", :description => "",:picture_name => "talent_ukulele.jpg", :category_id =>  7},
  {:title => "Les accords en Ukulele", :description => "",:picture_name => "talent_ukulele1.jpg", :category_id =>  7}
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
                            description: Faker::Lorem.paragraph(sentence_count: 2),  #talent[:description],
                            duration: Faker::Number.between(from: 60, to: 240),  
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
                            description: Faker::Lorem.paragraph(sentence_count: 2),  #talent[:description],
                            duration: Faker::Number.between(from: 60, to: 240),  
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
puts "TALENTS TOTAL              : #{Talent.count}/51"
puts "J_TALENTS_CATEGORIES TOTAL : #{JoinTableTalentCategory.count}/51"
puts "========================================================="



# --- APPOINTMENTS ---
past_appointments = []
Talent.all.each do |talent|
  # PAST APPOINTMENTS
  rand(1..5).times do
    past_appointments << Appointment.create(
                  start_time: Faker::Date.between(from: '2020-11-01', to: '2020-12-09'),
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
    Appointment.create(
                  start_time: Faker::Date.between(from: '2020-12-15', to: '2021-01-31'),
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
    Appointment.create(
                  start_time: Faker::Date.between(from: '2020-12-15', to: '2021-01-31'),
                  mentor_id: talent.user_id,
                  apprentice_id: User.all.sample.id,
                  place_id: talent.place_id,
                  talent_id: talent.id,
                  is_mentor_validate: true,
                  is_paid: false
    )
  end
  # MENTOR VALIDATE APPOINTMENTS
  rand(1..3).times do
    Appointment.create(
                  start_time: Faker::Date.between(from: '2020-12-15', to: '2021-01-31'),
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
puts "APPOINTMENTS TOTAL : #{Appointment.count}"
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
puts "BOOKMARK TOTAL : #{Bookmark.count}"
puts "========================================================="




# --- REVIEWS ---
comment_constant = [
  "C'était chouette, je recommande ce mentor !",
  "La séance d'essai m'a vraiment permi de découvrir un nouveau monde, Merci !!",
  "Le temps est passé tellement vite... à quand un prochaine séance ?",
  "Le mentor a pris le temps de bien m'expliquer. Dommage que ce soit payant !",
  "Merci à mon mentor qui a assuré !",
  "Pourquoi ne pas proposer plus de contenu dans les séances ?",
  "J'ai adoré !",
  "Le mentor m'a bien aidé !",
  "Ca y est je suis lancé. Un grand merci !",
  "Waaaw c'était génial !!",
  "J'aurais aimé que cela dure plus longtemps ^^ !"
]
past_appointments.each do |appointment|
  # PAST APPOINTMENTS
  Review.create(
                appointment_id: appointment.id,
                mark: rand(2..5),
                comment: comment_constant.sample
  )
end
puts "========================================================="
puts "REVIEWS TOTAL : #{Review.count}"
puts "========================================================="