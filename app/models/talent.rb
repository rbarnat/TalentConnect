class Talent <  ActiveRecord::Base

#Talent has 1-N relationship to users
belongs_to :user
has_many :appointments
has_one_attached :picture
after_commit :add_default_picture, on: %i[create update]

validates :title,
    presence: true,
    length: { in: 3..140, message: "Le titre doit faire entre 3 et 140 caractères" }

validates :description,
    presence: true,
    length: { in: 10..1000, message: "La description doit faire entre 10 and 1000 caractères"}

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