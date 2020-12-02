class Appointment < ApplicationRecord
    validates :start_time, presence: true
    validates :duration,
    presence: true,
    numericality: { greater_than: 5, message: "La durée doit être supérieure à 5 minutes"}

    belongs_to :mentor, class_name: "User"
    belongs_to :apprentice, class_name: "User"
    belongs_to :place
    belongs_to :talent

end
