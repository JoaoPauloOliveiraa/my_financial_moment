class Client < ApplicationRecord
  has_and_belongs_to_many :loan_product

  validates :name, :cpf, :birth_date, :uf, :income, presence: true
  validates :cpf, uniqueness: true
  validates :cpf, length: { is: 11 }
  validates :uf, length: { is: 2 }
  validates :income, numericality: { greater_than: 0 }
  
  def set_loan_products
    products = []
    self.age = Time.zone.now.to_s.to_i - self.birth_date.to_s.to_i
    
    if self.income <= 3000
      products << LoanProduct.where(loan_type: "EMPRESTIMO_PESSOAL")
      products << LoanProduct.where(loan_type: "EMPRESTIMO_GARANTIA") if self.uf.upcase === "SP" && self.age < 30
    end

    if self.income >= 3000
      if self.income >= 5000
        products << LoanProduct.where(loan_type: "EMPRESTIMO_PESSOAL")
        products << LoanProduct.where(loan_type: "EMPRESTIMO_GARANTIA") if self.age < 30
        products << LoanProduct.where(loan_type: "EMPRESTIMO_CONSIGNADO")
      else
        products << LoanProduct.where(loan_type: "EMPRESTIMO_PESSOAL") if self.income > 3000
        products << LoanProduct.where(loan_type: "EMPRESTIMO_GARANTIA") if self.uf.upcase === "SP" if self.age > 30
      end
    end

    self.loan_product = products.flatten
  end

  def get_loan_products
    client = {
      name: self.name,
      cpf: self.cpf,
      age: self.age,
      uf: self.uf.upcase,
      renda_mensal: self.income,
      produto_emprestismo: self.loan_product.map { |product| 
      {
        tipo_empretismo: "#{product.loan_type}",
        taxa_juros: "#{product.interest_rate}%"
      }
      }
    }
    client
  end
end
