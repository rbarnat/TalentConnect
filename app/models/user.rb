class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User has only one place and avatar
  has_one :place
  has_one_attached :avatar
  # User has 1-N relationship to talents, appointments, messages and bookmarks
  has_many :talents
  has_many :appointments, foreign_key: 'apprentice_id', class_name: "User"
  has_many :appointments, foreign_key: 'mentor_id', class_name: "User"
  has_many :messages, foreign_key: 'sender_id', class_name: "User"
  has_many :messages, foreign_key: 'recipient_id', class_name: "User"
  has_many :bookmarks

  # Default avatar
  after_commit :add_default_avatar, on: %i[create update]

  # Let place params pass when updating the user
  accepts_nested_attributes_for :place
  # Validation check before creation
  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "doit être au bon format" }
  validates :password, length: { in: 6..20 }, allow_blank: true
  validates :first_name, :last_name, 
    presence: true,
    length: { minimum: 2}, allow_blank: true
  validates :phone_number, presence: true, allow_blank: true
  # Create a place associated to the user and send him a welcome mail
  after_create :create_place
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  private
  # Create a new place after a new user have been created and link them together
  def create_place
    @place = Place.create(address: "Adresse non renseignée", city_name: "Ville non renseignée", zip_code: "Code postal non renseigné")
    self.place_id = @place.id
  end

  # Attach a default avatar to user if doesn't have
  def add_default_avatar
    unless avatar.attached?
    avatar.attach(
        io: File.open(
        Rails.root.join(
            'app', 'assets', 'images', 'user_default.jpg' 
        )
        ), filename: 'user_default.jpg',
        content_type: 'image/jpg'
    )
    end
end

end
