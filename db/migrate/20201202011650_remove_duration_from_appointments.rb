class RemoveDurationFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :duration, :integer
  end
end
