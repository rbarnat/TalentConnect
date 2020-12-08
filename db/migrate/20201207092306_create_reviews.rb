class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :mark
      t.string :comment
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
