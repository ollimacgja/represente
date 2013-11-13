class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|

    	t.string	"referencia"
    	t.string	"descricao"
    	t.string	"unidade"
    	t.integer	"quantidade"
    	t.decimal	"preco_por_unidade"

    	t.belongs_to :orcamento

      t.timestamps
    end
  end
end
