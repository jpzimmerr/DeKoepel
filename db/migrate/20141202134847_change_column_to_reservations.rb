class ChangeColumnToReservations < ActiveRecord::Migration
  def change
		rename_column :reservations, :start, :started_at
		rename_column :reservations, :end, :ended_at
		add_column :reservations, :note, :text
		change_column :reservations, :description, :text
  end
end
