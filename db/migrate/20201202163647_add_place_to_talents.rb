class AddPlaceToTalents < ActiveRecord::Migration[5.2]
  def change
    add_column :talents, :default_place_id, :integer
  end
end
