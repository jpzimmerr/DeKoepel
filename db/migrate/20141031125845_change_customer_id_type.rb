class ChangeCustomerIdType < ActiveRecord::Migration
  def up
  	connection.execute(%q{
  		alter table reservations
  		alter column customer_id
  		type integer using cast (customer_id as integer)
  		})
  end
  
  def down
  	change_column :reservations, :customer_id, :string
  end
end
