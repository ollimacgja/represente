require 'factory_girl'

FactoryGirl.define do
  factory :orcamento do
    numero_orcamento 1
    user
    fornecedor
    cliente
  end
end