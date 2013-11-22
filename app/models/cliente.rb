class Cliente < ActiveRecord::Base

	has_many :orcamentos
	belongs_to :user
	belongs_to :uf

	has_many :telefones, as: :telefonavel, :dependent => :destroy
	accepts_nested_attributes_for :telefones, allow_destroy: true

	validates_presence_of :cnpj, :nome_fantasia, :razao_social, :endereco, :numero, :complemento, :bairro, :uf, :cep, :telefones

	def self.busca(texto)
    array = texto.gsub(/\s+/m, ' ').strip.split(" ")
    query = "UNACCENT(UPPER(razao_social)) LIKE UNACCENT(UPPER('%#{array[0]}%'))"
    unless array.size == 1
      array.each do |parte|
        next if parte == array[0]
        query += " AND UNACCENT(UPPER(razao_social)) LIKE UNACCENT(UPPER('%#{parte}%'))"
      end
    end
    where(query).limit(10)
	end

	def endereco_completo
		endereco.to_s + ", " + numero.to_s + " - " + complemento.to_s + " - " + bairro.to_s + " - " + municipio.to_s + " - " + uf.try(:sigla).to_s
	end
	
end
