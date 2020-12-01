class Talent <  ActiveRecord::Base

#Talent has 1-N relationship to users
belongs_to :user
has_many :appointments
has_one_attached :picture

validates :title,
    presence: true,
    length: { in: 3..140, message: "Title length must be between 3 and 140" }

validates :description,
    presence: true,
    length: { in: 10..1000, message: "Description length must be between 10 and 1000"}

# --- PG Search ---
include PgSearch::Model
pg_search_scope :roughly_spelled_like,
                against: :title,
                using: {
                    trigram: {
                        threshold: 0.2
                    }
                }

end