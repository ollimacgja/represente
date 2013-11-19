class FornecedoresController < ApplicationController

	def index
		@fornecedores = current_user.fornecedors.order(:id).page(params[:page]).per(10)
	end

	def new
		@fornecedor = current_user.fornecedors.build
	end

	def create
		@fornecedor = current_user.fornecedors.build(fornecedor_params)
		if @fornecedor.save
			flash[:notice] = "Fornecedor criado com sucesso"
			redirect_to fornecedores_path
		else
			render 'new'
		end
	end

  def edit
  	@fornecedor = current_user.fornecedors.find(params[:id])
  end

  def update
		@fornecedor = current_user.fornecedors.find(params[:id])
		if @fornecedor.update_attributes(fornecedor_params)
			redirect_to fornecedores_path, :notice => "Fornecedores alterado com sucesso."
		else
			render :action => 'edit'
		end
	end

	def destroy
		@fornecedor = current_user.fornecedors.find(params[:id])

		if @fornecedor.present?
			@fornecedor.destroy
			redirect_to fornecedores_path, :notice => "Fornecedor excluido com sucesso."
		end
		
	end
	
private
	def fornecedor_params
    params.require(:fornecedor).permit!
  end
end
