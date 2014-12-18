class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
