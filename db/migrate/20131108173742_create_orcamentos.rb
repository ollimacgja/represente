class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
    	t.integer  "user_id"
    	t.integer  "fornecedor_id"
    	t.integer  "cliente_id"
    	t.integer  "numero_orcamento"

      t.timestamps
    end
  end
end
