class Appointment < ApplicationRecord
  # An appointement must have a mentor, an apprentice, a place and concern a talent in particular
  belongs_to :mentor, class_name: "User"
  belongs_to :apprentice, class_name: "User"
  belongs_to :place
  belongs_to :talent
  # An appointment can have only one review written by the apprentice (mentor can't write review for now)
  has_one :review

  # Validation before creation
  validates :start_time, presence: true
  # Send mail to user after creating the appointment
  after_create :booking_user_send

  def booking_user_send
    UserMailer.booking_user_confirmation(self).deliver_now
  end
  
end
