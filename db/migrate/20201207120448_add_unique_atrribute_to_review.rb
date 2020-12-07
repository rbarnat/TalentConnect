class AddUniqueAtrributeToReview < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :appointment_id, :bigint, unique: true
  end
end
