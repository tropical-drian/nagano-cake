class ChangePublicCustomersToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_table :public_customers, :customers
  end
end
