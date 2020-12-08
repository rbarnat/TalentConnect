class AddBooleansToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :is_mentor_validate, :boolean, :default => false
    add_column :appointments, :is_paid, :boolean, :default => false
  end
end
