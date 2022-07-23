class CreateJoinTableClientLoanProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :clients, :loan_products do |t|
      t.index [:client_id, :loan_product_id]
      t.index [:loan_product_id, :client_id]
    end
  end
end
