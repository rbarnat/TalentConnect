class Appointment < ApplicationRecord
    validates :start_time, presence: true
    
    belongs_to :mentor, class_name: "User"
    belongs_to :apprentice, class_name: "User"
    belongs_to :place
    belongs_to :talent

end
