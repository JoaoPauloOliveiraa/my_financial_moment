# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_23_062622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "loan_type", ["EMPRESTIMO_CONSIGNADO", "EMPRESTIMO_PESSOAL", "EMPRESTIMO_GARANTIA"]

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.integer "age"
    t.datetime "birth_date", precision: nil, null: false
    t.string "uf", null: false
    t.float "incom", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_loan_products", id: false, force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "loan_product_id", null: false
    t.index ["client_id", "loan_product_id"], name: "index_clients_loan_products_on_client_id_and_loan_product_id"
    t.index ["loan_product_id", "client_id"], name: "index_clients_loan_products_on_loan_product_id_and_client_id"
  end

  create_table "loan_products", force: :cascade do |t|
    t.string "name"
    t.enum "loan_type", enum_type: "loan_type"
    t.float "interest_rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
