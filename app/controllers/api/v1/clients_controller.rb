class Api::V1::ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json: @clients, status: :ok
  end

  def create
    @client = Client.new(client_params)
    @client.set_loan_products
    if @client.save
      
      render json: @client.get_loan_products, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  private
    def client_params
      params.require(:client).permit(:name, :cpf, :birth_date, :uf, :income)
    end
end
