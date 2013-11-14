class OrcamentosController < ApplicationController

	def index
		@orcamentos = current_user.orcamentos.order(:numero_orcamento).page(params[:page]).per(10)
	end

	def new
		@orcamento = current_user.orcamentos.build
	end

	def create
		@orcamento = current_user.orcamentos.create(orcamento_params)
			debugger

		if @orcamento.save
			flash[:notice] = "Orcamento criado com sucesso"
			redirect_to orcamentos_path
		else
			render 'new'
		end
	end

	def orcamento_params
    params.require(:orcamento).permit(:fornecedor_id, :cliente_id, produtos_attributes: [:referencia, :descricao, :unidade, :quantidade, :preco_por_unidade])
  end
end
