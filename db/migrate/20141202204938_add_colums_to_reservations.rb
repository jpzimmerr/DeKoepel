class AddColumsToReservations < ActiveRecord::Migration
  def change

    add_column :reservations, :started_at, :datetime
    add_column :reservations, :ended_at, :datetime
  	
  end
end
