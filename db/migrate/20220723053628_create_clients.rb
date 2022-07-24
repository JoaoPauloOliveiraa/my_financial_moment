class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :cpf, unique: true, null: false
      t.integer :age
      t.timestamp :birth_date, null: false
      t.string :uf, null: false
      t.float :income, null: false

      t.timestamps
    end
  end
end
