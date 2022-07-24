class CreateClientsLoanProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :clients_loan_products, id: false do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :loan_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
