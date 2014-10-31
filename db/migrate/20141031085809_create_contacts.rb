class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :adress
      t.string :zip
      t.string :city
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
