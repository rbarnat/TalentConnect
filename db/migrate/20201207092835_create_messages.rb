class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :talent, index: true
      t.references :sender, index: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
