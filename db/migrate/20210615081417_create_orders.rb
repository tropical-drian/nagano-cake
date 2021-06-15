class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id, foreign_key: true
      t.integer :payment_method, default: 0
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :postage, default: 800
      t.string :total_price
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
