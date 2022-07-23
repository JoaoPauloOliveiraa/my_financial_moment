class CreateLoanProducts < ActiveRecord::Migration[7.0]
  def change
    create_enum :loan_type, ["EMPRESTIMO_CONSIGNADO", "EMPRESTIMO_PESSOAL", "EMPRESTIMO_GARANTIA"]
    create_table :loan_products do |t|
      t.string :name
      t.enum :loan_type, enum_type: :loan_type
      t.float :interest_rate, null: false

      t.timestamps
    end
  end
end
