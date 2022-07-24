# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  LoanProduct.create(name: "Empréstimo Pessoal", loan_type: "EMPRESTIMO_PESSOAL", interest_rate: 4)
  LoanProduct.create(name: "Empréstimo com Garantia", loan_type: "EMPRESTIMO_GARANTIA", interest_rate: 3)
  LoanProduct.create(name: "Empréstimo Consignado", loan_type: "EMPRESTIMO_CONSIGNADO", interest_rate: 2)