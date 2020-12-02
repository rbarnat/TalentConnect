class AddDurationToTalents < ActiveRecord::Migration[5.2]
  def change
    add_column :talents, :duration, :integer
  end
end
