class AddUserToTalents < ActiveRecord::Migration[5.2]
  def change
    add_reference :talents, :user, foreign_key: true
  end
end
