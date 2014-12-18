class CreateProductCatagories < ActiveRecord::Migration
  def change
    create_table :product_catagories do |t|
      t.string :name

      t.timestamps
    end
  end
end
