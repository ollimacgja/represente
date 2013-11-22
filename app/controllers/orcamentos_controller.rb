class OrcamentosController < ApplicationController

	def index
		@orcamentos = current_user.orcamentos.order(:numero_orcamento).page(params[:page]).per(10)
	end

	def new
		@orcamento = current_user.orcamentos.build
	end

	def show
		@orcamento = current_user.orcamentos.find(params[:id])
	end

	def create
		@orcamento = current_user.orcamentos.build(orcamento_params)
		if @orcamento.save
			flash[:notice] = "Orcamento criado com sucesso"
			redirect_to orcamentos_path
		else
			render 'new'
		end
	end

  def edit
  	@orcamento = current_user.orcamentos.find(params[:id])
  end

  def update
		@orcamento = current_user.orcamentos.find(params[:id])
		if @orcamento.update_attributes(orcamento_params)
			redirect_to orcamentos_path, :notice => "Orçamento alterado com sucesso."
		else
			render :action => 'edit'
		end
	end

	def destroy
		@orcamento = current_user.orcamentos.find(params[:id])

		if @orcamento.present?
			@orcamento.destroy
			redirect_to orcamentos_path, :notice => "Orcamento excluido com sucesso."
		end
		
	end
	
private
	def orcamento_params
    params.require(:orcamento).permit(:fornecedor_id, :cliente_id, produtos_attributes: [:referencia, :descricao, :unidade, :quantidade, :preco_por_unidade, :_destroy, :id])
  end

end
