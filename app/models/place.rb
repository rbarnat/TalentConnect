class Place < ApplicationRecord
    has_many :users
    
    validates :city_name, :zip_code, :address, presence: true
end
