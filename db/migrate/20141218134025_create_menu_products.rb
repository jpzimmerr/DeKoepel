class CreateMenuProducts < ActiveRecord::Migration
  def change
    create_table :menu_products do |t|
      t.integer :menu_id
      t.integer :product_id

      t.timestamps
    end
  end
end
