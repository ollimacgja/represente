class Cliente < ActiveRecord::Base

	has_many :orcamentos
	belongs_to :user
	belongs_to :uf

	has_many :telefones, as: :telefonavel, :dependent => :destroy
	accepts_nested_attributes_for :telefones, allow_destroy: true

	validates_presence_of :cnpj, :nome_fantasia, :razao_social, :endereco, :numero, :complemento, :bairro, :uf, :cep, :telefones
end
