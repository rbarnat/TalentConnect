class AddPriceColumnTalent < ActiveRecord::Migration[5.2]
  def change
    add_column :talents, :price, :decimal
  end
end
