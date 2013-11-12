require 'factory_girl'

FactoryGirl.define do
  factory :orcamento do
    user				
    fornecedor	{FactoryGirl.create(:fornecedor)}
    cliente			{FactoryGirl.create(:cliente)}


  end
end