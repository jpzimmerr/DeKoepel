class DelcolumnReservations < ActiveRecord::Migration
  def change
  	remove_column :reservations, :started_at
  	remove_column :reservations, :ended_at

  	add_column :reservations, :started_at, :datetime
    add_column :reservations, :ended_at, :datetime
  end
end
