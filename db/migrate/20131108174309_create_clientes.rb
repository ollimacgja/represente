class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
    	t.string   "cnpj"
	    t.string   "inscricao_estadual"
	    t.string   "inscricao_municipal"
	    t.string   "nome_fantasia"
	    t.string   "razao_social"
	    t.string   "endereco"
	    t.integer  "numero"
	    t.string   "complemento"
	    t.string   "bairro"
	    t.integer  "municipio_id"
	    t.integer  "uf_id"
	    t.integer  "cep"
	    t.integer  "ddd1"
	    t.integer  "telefone1"
	    t.integer  "ddd2"
	    t.integer  "telefone2"
	    t.integer  "ddd_fax"
	    t.integer  "fax"
      t.timestamps
    end
  end
end
