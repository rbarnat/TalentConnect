class Bookmark < ApplicationRecord
  # Bookmark is the link between a user and a talent
  belongs_to :user
  belongs_to :talent
end
