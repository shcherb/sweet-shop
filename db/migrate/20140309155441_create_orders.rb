class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :count
      t.decimal :sum
      t.decimal :discount_sum
      t.boolean :payed
      t.boolean :done

      t.timestamps
    end
  end
end
