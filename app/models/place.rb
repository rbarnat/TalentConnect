class Place < ApplicationRecord
    has_many :users
    has_many :appointments
     
    validates :city_name, :zip_code, :address, presence: true
end
