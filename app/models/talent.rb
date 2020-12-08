class Talent <  ActiveRecord::Base

# Talent has only one user and picture
belongs_to :user
has_one_attached :picture
# Talent has 1-N relationship to appointments, bookmarks and messages
has_many :appointments
has_many :bookmarks
has_many :messages
# A talent can have many categories
has_many :JoinTableTalentCategory
has_many :categories, through: :JoinTableTalentCategory

# Default picture
after_commit :add_default_picture, on: %i[create update]

# Talent has 1-N relationship to places
belongs_to :place

# Enable place creation when creating a talent
accepts_nested_attributes_for :place
# Validation before creation
validates :duration,
  presence: true,
  numericality: { greater_than: 29, message: "La scéance doit durer 30 minutes au minimum"}

validates :title,
  presence: true,
  length: { in: 3..140, message: "Le titre doit faire entre 3 et 140 caractères" }

validates :description,
  presence: true,
  length: { in: 10..1000, message: "La description doit faire entre 10 et 1000 caractères"}

validates :price,
    presence: true,
    numericality: {greater_than: 0, message: "Le prix doit être supérieur à zéro"}

# --- PG Search ---
include PgSearch::Model
pg_search_scope :roughly_spelled_like,
  against: :title,
  using: {
    trigram: {
      threshold: 0.2
      }
  }
  
private

  # Attach a default picture to talent if doesn't have
  def add_default_picture
    unless picture.attached?
      picture.attach(
        io: File.open(
        Rails.root.join(
            'app', 'assets', 'images', 'talent_default.jpg' 
        )
        ), filename: 'talent_default.jpg',
        content_type: 'image/jpg'
    )
    end
  end


end