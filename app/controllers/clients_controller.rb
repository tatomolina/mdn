class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = "Cliente creado correctamente"
      redirect_to clients_path
    else
      flash[:alert] = "#{@client.errors.count} error no permitio crear este cliente: "
      @client.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @client.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      flash[:notice] = "Pedido actualizado correctamente"
      redirect_to clients_path
    else
      flash[:alert] = "#{@order.errors.count} error no permitio actualizar este cliente: "
      @order.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @order.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to clients_path
  end


  private

  def client_params
    params.require(:client).permit(:name)
  end

end
