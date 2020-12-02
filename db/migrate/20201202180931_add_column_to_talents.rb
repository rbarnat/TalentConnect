class AddColumnToTalents < ActiveRecord::Migration[5.2]
  def change
    add_reference :talents, :place, foreign_key: true
  end
end
