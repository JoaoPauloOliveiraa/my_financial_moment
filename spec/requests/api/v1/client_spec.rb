require 'rails_helper'

RSpec.describe "Api::V1::Clients", type: :request do
  context 'index' do
    it 'should return status ok' do
      get "/api/v1/clients"
      expect(response).to have_http_status(200)
    end
  end

  it 'should return all client' do
    client = Client.create(name: 'Joao', cpf: '12345678911', age: 32, birth_date: '1990/03/17', uf: 'PR', income: '3000')
    other_client = Client.create(name: 'Suellen', cpf: '12345678912', age: 32, birth_date: '1992/07/25', uf: 'PR', income: '3000')
    
    get '/api/v1/clients'
  
    expect(response).to have_http_status(200)
    expect(response.body).to include client.name
    expect(response.body).to include client.cpf
    expect(response.body).to include client.age.to_s
    expect(response.body).to include client.birth_date.to_date.to_s
    expect(response.body).to include client.uf
    expect(response.body).to include client.income.to_s
    expect(response.body).to include other_client.name
    expect(response.body).to include other_client.cpf
    expect(response.body).to include other_client.age.to_s
    expect(response.body).to include other_client.birth_date.to_date.to_s
    expect(response.body).to include other_client.uf
    expect(response.body).to include other_client.income.to_s
 end

  it 'should create a client with loan product EMPRESTIMO_PESSOAL' do
    LoanProduct.create(loan_type: 'EMPRESTIMO_PESSOAL', interest_rate: 4)
    LoanProduct.create(loan_type: 'EMPRESTIMO_GARANTIA', interest_rate: 3)
    LoanProduct.create(loan_type: 'EMPRESTIMO_CONSIGNADO',  interest_rate: 2)
    client = Client.create(name: 'Joao', cpf: '00000', age: 32, birth_date: '1990/03/17', uf: 'PR', income: '3000')

    post '/api/v1/clients', params: { client: { name: 'Joao', cpf: '12345678911', age: 32, birth_date: '1990/03/17', uf: 'PR', income: '3000' } }
   
    expect(response).to have_http_status(201)
    expect(response.body).to eq("{\"name\":\"Joao\",\"cpf\":\"12345678911\",\"age\":32,\"uf\":\"PR\",\"renda_mensal\":3000.0,\"produto_emprestismo\":[{\"tipo_empretismo\":\"EMPRESTIMO_PESSOAL\",\"taxa_juros\":\"4.0%\"}]}")
  end

  it 'should create a client with loan product EMPRESTIMO_PESSOAL and EMPRESTIMO_CONSIGNADO' do
    LoanProduct.create(loan_type: 'EMPRESTIMO_PESSOAL', interest_rate: 4)
    LoanProduct.create(loan_type: 'EMPRESTIMO_GARANTIA', interest_rate: 3)
    LoanProduct.create(loan_type: 'EMPRESTIMO_CONSIGNADO',  interest_rate: 2)
    
    post '/api/v1/clients', params: { client: { name: 'Joao', cpf: '12345678911', age: 29, birth_date: '1990/03/17', uf: 'PR', income: '5000' } }

    expect(response).to have_http_status(201)
    expect(response.body).to eq("{\"name\":\"Joao\",\"cpf\":\"12345678911\",\"age\":32,\"uf\":\"PR\",\"renda_mensal\":5000.0,\"produto_emprestismo\":[{\"tipo_empretismo\":\"EMPRESTIMO_PESSOAL\",\"taxa_juros\":\"4.0%\"},{\"tipo_empretismo\":\"EMPRESTIMO_CONSIGNADO\",\"taxa_juros\":\"2.0%\"}]}")
  end

  it 'should create a client with loan product EMPRESTIMO_PESSOAL and EMPRESTIMO_GARANTIA' do
    LoanProduct.create(loan_type: 'EMPRESTIMO_PESSOAL', interest_rate: 4)
    LoanProduct.create(loan_type: 'EMPRESTIMO_GARANTIA', interest_rate: 3)
    LoanProduct.create(loan_type: 'EMPRESTIMO_CONSIGNADO',  interest_rate: 2)
    
    post '/api/v1/clients', params: { client: { name: 'Joao', cpf: '12345678911', age: 29, birth_date: '1990/03/17', uf: 'sp', income: '3000' } }
   
    expect(response).to have_http_status(201)
    expect(response.body).to eq("{\"name\":\"Joao\",\"cpf\":\"12345678911\",\"age\":32,\"uf\":\"SP\",\"renda_mensal\":3000.0,\"produto_emprestismo\":[{\"tipo_empretismo\":\"EMPRESTIMO_PESSOAL\",\"taxa_juros\":\"4.0%\"},{\"tipo_empretismo\":\"EMPRESTIMO_GARANTIA\",\"taxa_juros\":\"3.0%\"}]}")
  end
end
