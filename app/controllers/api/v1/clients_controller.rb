class Api::V1::ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json: @clients, status: :ok
  end

  def show
    @client = Client.find(params[:id])
    render json: @client, status: :ok
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

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      render json: @client, status: :ok
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    head :no_content
  end

  private
    def client_params
      params.require(:client).permit(:name, :cpf, :birth_date, :uf, :income)
    end
end
