class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.integer :duration
      t.references :mentor, index: true
      t.references :apprentice, index: true
      t.references :place, index:true
      t.references :talent, index:true

      t.timestamps
    end
  end
end
