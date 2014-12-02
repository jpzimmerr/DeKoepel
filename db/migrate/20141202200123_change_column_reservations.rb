class ChangeColumnReservations < ActiveRecord::Migration
  def change
	remove_column :reservations, :started_at
  	remove_column :reservations, :ended_at
  end
end
