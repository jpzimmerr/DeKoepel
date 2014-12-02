class ChangeColumnsToReservations < ActiveRecord::Migration
	def change
		remove_column :reservations, :date
		add_column :reservations, :amount, :integer

	end
	
end

