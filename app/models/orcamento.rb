class Orcamento < ActiveRecord::Base

	belongs_to :user
	belongs_to :fornecedor
	belongs_to :cliente

	validates_presence_of :user, :fornecedor, :cliente

	validates_uniqueness_of :numero_orcamento, scope: :user

	has_many :produtos, :dependent => :destroy
	accepts_nested_attributes_for :produtos, :allow_destroy => true

	before_save	:gera_numero_orcamento

	def gera_numero_orcamento
		unless numero_orcamento.present?

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

	def calcula_total
		total = 0
		produtos.each do |produto|
			total += (produto.quantidade * produto.preco_por_unidade)
		end
		self.total_orcamento = total.round(4)
		save

		total.round(4)
	end
end
