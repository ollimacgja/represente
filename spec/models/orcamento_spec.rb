require 'spec_helper'

describe Orcamento do
	it { should belong_to(:user) }
	it { should belong_to(:fornecedor)}
	it { should belong_to(:cliente)}

	it { should validate_presence_of(:user) }
	it { should validate_presence_of(:fornecedor) }
	it { should validate_presence_of(:cliente) }

	it { should validate_uniqueness_of(:numero_orcamento).scoped_to(:user_id) }

	describe "ao inicializar" do
			before(:each) do
				@attribs = FactoryGirl.attributes_for(:orcamento)
				@user = FactoryGirl.create(:user)
				@orcamento = @user.orcamentos.create(@attribs)
			end
		
		it 'deve pertencer ao usuario' do
			@orcamento.user_id.should == @user.id
		end


		it 'deverá somar um ao numero do orcamento anterior' do
			debugger
			@orcamento_dois = @user.orcamentos.create(@attribs)
			@orcamento_dois.numero_orcamento.should == (@orcamento.numero_orcamento + 1)
		end


	end
end
