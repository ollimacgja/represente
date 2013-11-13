require 'spec_helper'

describe Orcamento do
	it { should belong_to(:user) }
	it { should belong_to(:fornecedor)}
	it { should belong_to(:cliente)}

	it { should validate_presence_of(:user) }
	it { should validate_presence_of(:fornecedor) }
	it { should validate_presence_of(:cliente) }

	it { should validate_uniqueness_of(:numero_orcamento).scoped_to(:user_id) }

	it { should have_many(:produtos)}
	it { should accept_nested_attributes_for(:produtos) }

	describe do
			before(:each) do
				@attribs = FactoryGirl.attributes_for(:orcamento)
				@user = FactoryGirl.create(:user)
				@orcamento = @user.orcamentos.create(@attribs)
			end
		
		it 'deve pertencer ao usuario' do
			@orcamento.user_id.should == @user.id
		end


		it 'deverá somar um ao numero do orcamento anterior' do
			orcamento = @user.orcamentos.create(@attribs)
			orcamento.numero_orcamento.should == (@orcamento.numero_orcamento + 1)
		end

		it 'não deverá somar ao numero de orçamento caso este esteja presente' do
			orcamento = @user.orcamentos.build(@attribs)
			orcamento.numero_orcamento = 444
			orcamento.save
			orcamento.numero_orcamento.should == 444
		end

		it 'deve calcular o valor total do orcamento' do
			orcamento = @user.orcamentos.create(@attribs)
			attribs_prod1 = FactoryGirl.attributes_for(:produto)
			attribs_prod2 = FactoryGirl.attributes_for(:produto)
			attribs_prod3 = FactoryGirl.attributes_for(:produto)
			produto1 = orcamento.produtos.create(attribs_prod1)
			produto2 = orcamento.produtos.create(attribs_prod2)
			produto3 = orcamento.produtos.create(attribs_prod3)
			valor_total = (produto1.quantidade * produto1.preco_por_unidade)+(produto2.quantidade * produto2.preco_por_unidade)+(produto3.quantidade * produto3.preco_por_unidade)
			orcamento.calcula_total
			orcamento.total_orcamento.should == valor_total
		end

	end
end
