class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #User has 1-N relationship to places and talents
  has_one :place
  has_many :talents
  has_many :appointments, foreign_key: 'apprentice_id', class_name: "User"
  has_many :appointments, foreign_key: 'mentor_id', class_name: "User"

  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "doit être au bon format" }
  validates :password, length: { in: 6..20 }, allow_blank: true
  validates :first_name, :last_name, 
    presence: true,
    length: { minimum: 2}, allow_blank: true
  validates :phone_number, presence: true, allow_blank: true

end
