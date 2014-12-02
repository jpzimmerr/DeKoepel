class ChangeColumnReservations < ActiveRecord::Migration
  def change
	change_column :reservations, :started_at, :datetime
  	change_column :reservations, :ended_at, :datetime
  end
end
