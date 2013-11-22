class ClientesController < ApplicationController

	def index
		@clientes = current_user.clientes.order(:id).page(params[:page]).per(10)
	end

	def new
		@cliente = current_user.clientes.build
	end

	def create
		@cliente = current_user.clientes.build(cliente_params)
		if @cliente.save
			flash[:notice] = "Cliente criado com sucesso"
			redirect_to clientes_path
		else
			render 'new'
		end
	end

  def edit
  	@cliente = current_user.clientes.find(params[:id])
  end

  def update
		@cliente = current_user.clientes.find(params[:id])
		if @cliente.update_attributes(cliente_params)
			redirect_to clientes_path, :notice => "Cliente alterado com sucesso."
		else
			render :action => 'edit'
		end
	end

	def destroy
		@cliente = current_user.clientes.find(params[:id])

		if @cliente.present?
			@cliente.destroy
			redirect_to clientes_path, :notice => "Cliente excluido com sucesso."
		end
		
	end

	def search
		busca = Fornecedor.busca(params[:term])
		render :json => busca.map {|fornecedor| {:label => fornecedor.razao_social, :value => fornecedor.razao_social, :id => fornecedor.id }}
	end

	
private
	def cliente_params
    params.require(:cliente).permit!
  end

end
