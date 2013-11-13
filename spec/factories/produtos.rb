# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :produto do
  	orcamento
  	referencia			{"AB"+rand(999).to_s}
  	descricao			"Produtos de Testes"
  	unidade				"Unidade"
  	quantidade			{(1..9999).to_a.sample}
  	preco_por_unidade	{((1..999999).to_a.sample)/100.to_f}
  end
end
