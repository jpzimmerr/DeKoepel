class AddColumnsToCustomers < ActiveRecord::Migration
  def change

	add_column :customers, :address, :string
	add_column :customers, :zip, :string
	add_column :customers, :city, :string
  end
end