class JoinTableTalentCategory < ApplicationRecord
  # Link table between talent and category
  belongs_to :talent
  belongs_to :category
end
