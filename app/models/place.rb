class Place < ApplicationRecord
    has_many :users
    has_many :appointments
    has_many :talents
     
    validates :city_name, :zip_code, :address, presence: true
end
