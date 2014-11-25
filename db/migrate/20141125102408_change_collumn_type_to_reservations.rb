class ChangeCollumnTypeToReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :date, :date
  	change_column :reservations, :start, :time
  	change_column :reservations, :end, :time

  end
end