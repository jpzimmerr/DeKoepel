class AddColumsToReservations < ActiveRecord::Migration
  def change

    add_column :reservations, :started_at, :time
    add_column :reservations, :ended_at, :time
  	
  end
end
