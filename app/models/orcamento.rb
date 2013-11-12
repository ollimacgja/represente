class Orcamento < ActiveRecord::Base


	belongs_to :user
	belongs_to :fornecedor
	belongs_to :cliente

	validates_presence_of :user, :fornecedor, :cliente

	validates_uniqueness_of :numero_orcamento, scope: :user

	before_save	:gera_numero_orcamento

	def gera_numero_orcamento
		if user.present?
			ultimo_numero = user.orcamentos.maximum(:numero_orcamento)
			if ultimo_numero.present?
				self.numero_orcamento = ultimo_numero+1
			else
				self.numero_orcamento = 1
			end
		end
	end


end
