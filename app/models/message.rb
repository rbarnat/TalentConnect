class Message < ApplicationRecord
  # A message is about a particular talent and has only one sender and one recipient who are both users
  belongs_to :talent
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  # Validation before creation
  validates :content, presence: true
end
