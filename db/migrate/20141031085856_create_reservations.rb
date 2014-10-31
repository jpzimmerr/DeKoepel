class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :date
      t.string :start
      t.string :end
      t.string :description
      t.string :status
      t.string :customer_id

      t.timestamps
    end
  end
end
