class ChangeDefaultStatusInAppointments < ActiveRecord::Migration[7.2]
  def change
    change_column_default :appointments, :status, 0
  end
end
