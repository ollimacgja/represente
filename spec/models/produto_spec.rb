require 'spec_helper'

describe Produto do

	it { should belong_to(:orcamento) }

	it { should validate_presence_of(:orcamento) }
	it { should validate_presence_of(:referencia) }
	it { should validate_presence_of(:descricao) }
	it { should validate_presence_of(:unidade) }
	it { should validate_presence_of(:quantidade) }
	it { should validate_presence_of(:preco_por_unidade) }

	it { should validate_numericality_of(:quantidade).is_greater_than(0)}
	it { should validate_numericality_of(:preco_por_unidade).is_greater_than(0) }


end
