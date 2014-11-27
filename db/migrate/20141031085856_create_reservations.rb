class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :start
      t.time :end
      t.string :description
      t.string :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
