class CreateJoinTableTalentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_talent_categories do |t|
      t.references :talent, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
