class Appointment < ApplicationRecord
  validates :start_time, presence: true
    
  belongs_to :mentor, class_name: "User"
  belongs_to :apprentice, class_name: "User"
  belongs_to :place
  belongs_to :talent

  after_create :booking_user_send

  def booking_user_send
    UserMailer.booking_user_confirmation(self).deliver_now
  end
  
end
