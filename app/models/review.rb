class Review < ApplicationRecord
  # A review concern only one appointment
  has_one :appointment

  validates :mark,
  presence: true,
  inclusion: {:in => 1..5, message: "La note doit être comprise entre 1 et 5."}

  validates :comment,
    presence: true,
    length: { in: 3..500, message: "Le commentaire doit faire entre 3 et 500 caractères." }
  # An appointment can't be reviewd multiple time
  validates_uniqueness_of :appointment_id
end
