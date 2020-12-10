class Category < ApplicationRecord
  # A category can include many talents
  has_many :JoinTableTalentCategory, dependent: :destroy
  has_many :talents, through: :JoinTableTalentCategory

  # Validation before creation
  validates :title,
  presence: true,
  uniqueness: { message: "Une catégorie portant le même nom existe déjà!" },
  length: { in: 3..140, message: "Le titre doit faire entre 3 et 140 caractères" }
end
