class Talent < ApplicationRecord

#Talent has 1-N relationship to users
belongs_to :user

validates :title,
    presence: true,
    length: { in: 3..140, message: "Title length must be between 3 and 140" }

validates :description,
    presence: true,
    length: { in: 10..1000, message: "Description length must be between 10 and 1000"}

end
