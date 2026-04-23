class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :item_type
      t.integer :gender
      t.integer :age_group
      t.integer :price

      t.timestamps
    end
  end
end
