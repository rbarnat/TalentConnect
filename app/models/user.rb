class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #User has 1-N relationship to places
  has_one :place

  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "wrong email format" }
  validates :password, length: { in: 6..20 }, allow_blank: true
  validates :first_name, :last_name, 
    presence: true,
    length: { minimum: 2}
  validates :phone_number, presence: true

end
