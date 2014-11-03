class ChangeCustomerIdType < ActiveRecord::Migration
  def up
  	change_column :reservations, :customer_id, :integer
  end
  
  def down
  	change_column :reservations, :customer_id, :string
  end
end
