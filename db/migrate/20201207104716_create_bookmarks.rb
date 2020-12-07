class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :talent, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
