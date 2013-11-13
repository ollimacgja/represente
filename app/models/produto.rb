class Produto < ActiveRecord::Base

	validates_presence_of :referencia, :descricao, :unidade, :quantidade, :preco_por_unidade

	belongs_to :orcamento
	validates_presence_of :orcamento

	validates_numericality_of :preco_por_unidade, greater_than: 0
	validates_numericality_of :quantidade, greater_than: 0

end
